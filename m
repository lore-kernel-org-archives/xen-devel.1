From: Lars Kurth <lars.kurth@citrix.com>
Subject: [BUG] docs: our man page generation uses
 http://man.he.net/ by default which causes broken links. It should be
 changed to point to a relative path
Date: Thu, 2 Aug 2018 11:24:52 +0000
Message-ID: <24902838-BA23-4032-8FCC-384CA51C0A4E@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2lmd=kr=citrix.com=prvs=7459f703a=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1flBix-0004NM-Nq
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 11:24:55 +0000
Content-Language: en-US
Content-ID: <6050169AC8DEE943B2C274D2784F483F@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLA0KDQptb3N0IG9mIG91ciBtYW4gcGFnZXMgb24gcHJldHR5IG11Y2ggYWxsIHJlbGVh
c2VzIGZyb20gNC4yIGNvbnRhaW4gYnJva2VuIGxpbmtzLiANCg0KRm9yIGV4YW1wbGU6DQpJbiBo
dHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21hbi94bC5jZmcuNS5odG1sIHRo
ZSBzb3VyY2UgY29udGFpbnM6DQoNCiJGb3IgbW9yZSBkZXRhaWxzLCBzZWUgTDx4bC1udW1hLXBs
YWNlbWVudCg3KT4uIiANCk1hcHMgb250byBodHRwOi8vbWFuLmhlLm5ldC9tYW43L3hsLW51bWEt
cGxhY2VtZW50ICAoZG9lcyBub3QgZXhpc3QpDQoNCuKAnFNlZcKgTDxodHRwOi8vbWFuLmhlLm5l
dC9tYW41L3hsLWRpc2stY29uZmlndXJhdGlvbj7CoGZvciBtb3JlIGRldGFpbHMu4oCdIA0KTWFw
cyBvbnRvIGh0dHA6Ly9tYW4uaGUubmV0L21hbjUveGwtZGlzay1jb25maWd1cmF0aW9uIChkb2Vz
IG5vdCBleGlzdCkNCg0KRXRjLg0KDQpUaGVyZSBzZWVtIHRvIGJlIHR3byBpc3N1ZXM6DQoqIFRo
ZSByb290IHBhdGggaHR0cDovL21hbi5oZS5uZXQsIHdoaWNoIGlzIGluY29ycmVjdA0KKiBUaGUg
cmVzb2x1dGlvbiBvZiBmaWxlbmFtZXMgdG8gbWFuPHg+LzxuYW1lPjogc2hvdWxkIGJlIG1hbi88
bmFtZT4uPHg+Lmh0bWwNCg0KUHJvYmFibHkgd2UgbmVlZCB0byBmZWVkIHNvbWUgYXJndW1lbnRz
IHRvIHByb2JhYmx5IHdlIG5lZWQgdG8gZmVlZCBzb21lIGFyZ3VtZW50cyANCnRvIHBvZDJodG1s
IGluIG9yZGVyIHRvIGdlbmVyYXRlIHRoZSBjb3JyZWN0IHVybHMuIFNlZSDCoGh0dHBzOi8vcGVy
bGRvYy5wZXJsLm9yZy9wb2QyaHRtbC5odG1sIA0KKG1heWJlIHdlIG5lZWQgd2UgbmVlZCDigJNo
dG1sZGlyKS4gRm9yIG91ciBkb2NzIGJ1aWxkLCB0aGlzIHNob3VsZCBwcm9iYWJseSBnbyB0byAN
Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUvbWFuLyB3aGlsZSBmb3IgbG9j
YWwgaW5zdGFsbHMgdG8gDQoke3ByZWZpeH0vc2hhcmUvZG9jL3hlbi9odG1sL21hbiBvciBzb21l
dGhpbmcgbGlrZSBpdC4NCg0KSSBoYWQgYSBsb29rIHRvIHNlZSB3aGV0aGVyIEkgY2FuIGZpeCB0
aGlzLCBidXQgdGhhdCBzZWVtcyBhIGxpdHRsZSB0b28gY29tcGxleCBmb3IgbWUNCg0KUmVnYXJk
cw0KTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
