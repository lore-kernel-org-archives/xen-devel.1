From: Marcello Seri <marcello.seri@citrix.com>
Subject: [PATCH for-4.11 0/2] xenstore: reduce use of unsafe
 conversions
Date: Thu, 31 May 2018 14:05:35 +0100
Message-ID: <20180531130537.5037-1-marcello.seri@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5sm8=is=citrix.com=prvs=6828164cc=marcello.seri@srs-us1.protection.inumbo.net>)
 id 1fONGw-0006w6-7D
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 13:05:42 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Marcello Seri <marcello.seri@citrix.com>, Christian Lindig <christian.lindig@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiB4ZW5zdG9yZSB3YXMgdXBkYXRlZCB0byBzdXBwb3J0IHNhZmUtc3RyaW5nLCBzb21lIHVu
bmVjZXNzYXJ5CmNvcGllcyB3ZXJlIGludHJvZHVjZWQuIEEgZnVydGhlciBwYXRjaCByZWR1Y2Vk
IHRoZSBjb3BpZXMgYXQgdGhlIHByaWNlCm9mIG1hbnkgY2FsbHMgdG8gdW5zYWZlIGNvbnZlcnNp
b25zIGJldHdlZW4gYnl0ZXMgYW5kIHN0cmluZ3MuIEluIHRoZQpwb3J0IHdlIGFsc28gZGlkIG5v
dCBub3RpY2UgdGhhdCBzb21lIEMgc3R1YnMgd2VyZSBzdGlsbCBpbmNvcnJlY3RseQp1c2luZyBv
Y2FtbCBzdHJpbmdzIGFzIG11dGFibGUgcGF5bG9hZC4KClRoaXMgc2V0IG9mIHBhdGNoZXMgdXBk
YXRlcyB0aGUgQyBzdHVicyB0aGF0IHVzZSBtdXRhYmxlIHBheWxvYWRzIHBhc3NlZApmcm9tIG9j
YW1sLCBhbmQgcmVkdWNlcyB0aGUgYW1vdW50IG9mIHVuc2FmZSBjb252ZXJzaW9ucyB3aGVyZSBw
b3NzaWJsZQp3aXRob3V0IGZ1cnRoZXIgaW5jcmVhc2luZyB0aGUgbnVtYmVyIG9mIGNvcGllcy4K
ClRoaXMgc2VlbXMgYWxzbyB0byBmaXggc29tZSB1bmNsZWFyIGluc3RhYmlsaXRpZXMgdGhhdCBh
cHBlYXJlZCBhZnRlcgp0aGUgZm9ybWVyIHBhdGNoIGludHJvZHVjaW5nIHRoZSB1bnNhZmUgY29u
dmVyc2lvbiB3aXRoIHNvbWUgdmVyc2lvbiBvZgp0aGUgb2NhbWwgY29tcGlsZXIuCgpNYXJjZWxs
byBTZXJpICgyKToKICBvY2FtbC9saWJzL3hiOiB1c2UgYnl0ZXMgaW4gcGxhY2Ugb2Ygc3RyaW5n
cyBmb3IgbXV0YWJsZSBidWZmZXJzCiAgb2NhbWwveGVuc3RvcmVkOiByZWR1Y2UgdXNlIG9mIHVu
c2FmZSBjb252ZXJzaW9ucwoKIHRvb2xzL29jYW1sL2xpYnMveGIveGIubWwgICAgICAgIHwgMTIg
KysrKystLS0tLS0tCiB0b29scy9vY2FtbC9saWJzL3hiL3hiLm1saSAgICAgICB8ICAyICstCiB0
b29scy9vY2FtbC9saWJzL3hiL3hzX3JpbmcubWwgICB8IDEyICsrKysrKystLS0tLQogdG9vbHMv
b2NhbWwveGVuc3RvcmVkL2xvZ2dpbmcubWwgfCAxNiArKysrKystLS0tLS0tLS0tCiB0b29scy9v
Y2FtbC94ZW5zdG9yZWQvc3RkZXh0Lm1sICB8ICAyICstCiB0b29scy9vY2FtbC94ZW5zdG9yZWQv
dXRpbHMubWwgICB8ICA5ICsrKystLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspLCAyOSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
