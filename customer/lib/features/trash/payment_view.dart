import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _months = ['All', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  int _selectedMonthIndex = 0;

  final List<Transaction> _transactions = [
    Transaction(
      id: 'TRX-7845-9012',
      title: 'Package Delivery',
      amount: 300000,
      date: DateTime(2023, 7, 15, 14, 30),
      status: TransactionStatus.completed,
      type: TransactionType.debit,
      icon: Icons.local_shipping,
      description: 'Payment for package delivery from Ha Noi to Ho Chi Minh City',
    ),
    Transaction(
      id: 'TRX-6532-8901',
      title: 'Food Delivery',
      amount: 150000,
      date: DateTime(2023, 7, 12, 19, 45),
      status: TransactionStatus.completed,
      type: TransactionType.debit,
      icon: Icons.fastfood,
      description: 'Payment for food delivery from Pho 24 Restaurant',
    ),
    Transaction(
      id: 'TRX-5421-7890',
      title: 'Wallet Top-up',
      amount: 500000,
      date: DateTime(2023, 7, 10, 10, 15),
      status: TransactionStatus.completed,
      type: TransactionType.credit,
      icon: Icons.account_balance_wallet,
      description: 'Wallet top-up via bank transfer',
    ),
    Transaction(
      id: 'TRX-4310-6789',
      title: 'Grocery Delivery',
      amount: 250000,
      date: DateTime(2023, 7, 5, 16, 20),
      status: TransactionStatus.completed,
      type: TransactionType.debit,
      icon: Icons.shopping_basket,
      description: 'Payment for grocery delivery from VinMart',
    ),
    Transaction(
      id: 'TRX-3209-5678',
      title: 'Refund',
      amount: 120000,
      date: DateTime(2023, 7, 3, 11, 30),
      status: TransactionStatus.completed,
      type: TransactionType.credit,
      icon: Icons.replay,
      description: 'Refund for cancelled order #ORD-9876',
    ),
    Transaction(
      id: 'TRX-2198-4567',
      title: 'Ride Booking',
      amount: 180000,
      date: DateTime(2023, 6, 28, 20, 15),
      status: TransactionStatus.completed,
      type: TransactionType.debit,
      icon: Icons.directions_car,
      description: 'Payment for ride from District 1 to District 7',
    ),
    Transaction(
      id: 'TRX-1087-3456',
      title: 'Wallet Top-up',
      amount: 1000000,
      date: DateTime(2023, 6, 25, 9, 45),
      status: TransactionStatus.completed,
      type: TransactionType.credit,
      icon: Icons.account_balance_wallet,
      description: 'Wallet top-up via credit card',
    ),
    Transaction(
      id: 'TRX-0976-2345',
      title: 'Package Delivery',
      amount: 350000,
      date: DateTime(2023, 6, 20, 13, 10),
      status: TransactionStatus.failed,
      type: TransactionType.debit,
      icon: Icons.local_shipping,
      description: 'Failed payment for package delivery due to insufficient balance',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Transaction> get _filteredTransactions {
    if (_selectedMonthIndex == 0) {
      return _transactions;
    } else {
      return _transactions.where((transaction) {
        return transaction.date.month == _selectedMonthIndex;
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Payment', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [Tab(text: 'Overview'), Tab(text: 'History')],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [_buildOverviewTab(), _buildHistoryTab()]),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Balance Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue[700]!, Colors.blue[500]!], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total Balance', style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 8),
                const Text('1,250,000₫', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBalanceActionButton(icon: Icons.add, label: 'Top Up', onTap: () {}),
                    _buildBalanceActionButton(icon: Icons.send, label: 'Send', onTap: () {}),
                    _buildBalanceActionButton(icon: Icons.qr_code_scanner, label: 'Scan', onTap: () {}),
                    _buildBalanceActionButton(icon: Icons.more_horiz, label: 'More', onTap: () {}),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Payment Methods
          const Text('Payment Methods', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 16),

          // Credit Card
          _buildPaymentMethodCard(icon: Icons.credit_card, title: 'Credit Card', subtitle: '•��•• •••• •••• 4567', trailing: 'Default'),

          // Bank Account
          _buildPaymentMethodCard(icon: Icons.account_balance, title: 'Bank Account', subtitle: 'Vietcombank •••• 7890', trailing: ''),

          // Add Payment Method Button
          Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.blue, width: 1)),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.add, color: Colors.blue),
              ),
              title: const Text('Add Payment Method', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 24),

          // Recent Transactions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
              TextButton(
                onPressed: () {
                  _tabController.animateTo(1);
                },
                child: const Text('See All'),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Recent Transaction List
          ...List.generate(3, (index) => _buildTransactionItem(_transactions[index])),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return Column(
      children: [
        // Month Filter
        Container(
          height: 50,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _months.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedMonthIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedMonthIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: isSelected ? Colors.blue : Colors.grey[200], borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(
                    _months[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[700],
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Transaction List
        Expanded(
          child:
              _filteredTransactions.isEmpty
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.receipt_long, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text('No transactions found', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                      ],
                    ),
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredTransactions.length,
                    itemBuilder: (context, index) {
                      final transaction = _filteredTransactions[index];

                      // Add date header if this is the first transaction or if the date is different from the previous one
                      final showDateHeader = index == 0 || !_isSameDay(transaction.date, _filteredTransactions[index - 1].date);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showDateHeader) ...[
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 16),
                              child: Text(
                                _formatDateHeader(transaction.date),
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                              ),
                            ),
                          ],
                          _buildTransactionItem(transaction),
                        ],
                      );
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildBalanceActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard({required IconData icon, required String title, required String subtitle, required String trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        trailing:
            trailing.isNotEmpty
                ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(4)),
                  child: Text(trailing, style: TextStyle(color: Colors.green[700], fontSize: 12)),
                )
                : null,
        onTap: () {},
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return GestureDetector(
      onTap: () => _showTransactionDetails(transaction),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: transaction.type == TransactionType.credit ? Colors.green[50] : Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(transaction.icon, color: transaction.type == TransactionType.credit ? Colors.green : Colors.blue),
          ),
          title: Text(transaction.title, style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(DateFormat('MMM dd, yyyy • hh:mm a').format(transaction.date), style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${transaction.type == TransactionType.credit ? '+' : '-'} ${_formatCurrency(transaction.amount)}',
                style: TextStyle(color: transaction.type == TransactionType.credit ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: _getStatusColor(transaction.status).withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(
                  _getStatusText(transaction.status),
                  style: TextStyle(color: _getStatusColor(transaction.status), fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTransactionDetails(Transaction transaction) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transaction Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                ],
              ),
              const SizedBox(height: 24),

              // Transaction Icon and Amount
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: transaction.type == TransactionType.credit ? Colors.green[50] : Colors.blue[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(transaction.icon, color: transaction.type == TransactionType.credit ? Colors.green : Colors.blue, size: 30),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${transaction.type == TransactionType.credit ? '+' : '-'} ${_formatCurrency(transaction.amount)}',
                      style: TextStyle(
                        color: transaction.type == TransactionType.credit ? Colors.green : Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: _getStatusColor(transaction.status).withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        _getStatusText(transaction.status),
                        style: TextStyle(color: _getStatusColor(transaction.status), fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Transaction Details
              _buildDetailItem('Transaction ID', transaction.id),
              _buildDetailItem('Type', transaction.title),
              _buildDetailItem('Date & Time', DateFormat('MMMM dd, yyyy • hh:mm a').format(transaction.date)),
              _buildDetailItem('Description', transaction.description),

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.receipt),
                      label: const Text('Receipt'),
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.help_outline),
                      label: const Text('Help'),
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 120, child: Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14))),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14))),
        ],
      ),
    );
  }

  String _formatCurrency(int amount) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return '${formatter.format(amount)}₫';
  }

  String _formatDateHeader(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == DateTime(now.year, now.month, now.day)) {
      return 'Today';
    } else if (dateToCheck == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM dd, yyyy').format(date);
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  Color _getStatusColor(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.completed:
        return Colors.green;
      case TransactionStatus.pending:
        return Colors.orange;
      case TransactionStatus.failed:
        return Colors.red;
    }
  }

  String _getStatusText(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.failed:
        return 'Failed';
    }
  }
}

enum TransactionType { credit, debit }

enum TransactionStatus { completed, pending, failed }

class Transaction {
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final TransactionStatus status;
  final TransactionType type;
  final IconData icon;
  final String description;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.type,
    required this.icon,
    required this.description,
  });
}
