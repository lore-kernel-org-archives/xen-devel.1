From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/3] x86/HVM: __hvm_copy() should not write to
 p2m_ioreq_server pages
Date: Tue, 13 Nov 2018 03:13:46 -0700
Message-ID: <5BEAA3DA02000078001FB5CB@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMVhf-0001d6-Q8
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:13:51 +0000
In-Reply-To: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDNiZGVjNTMwYTUgKCJ4ODYvSFZNOiBzcGxpdCBwYWdlIHN0cmFkZGxpbmcgZW11bGF0
ZWQgYWNjZXNzZXMgaW4KbW9yZSBjYXNlcyIpIGludHJvZHVjZWQgYSBodm1fY29weV90b19ndWVz
dF9saW5lYXIoKSBhdHRlbXB0IGJlZm9yZQpmYWxsaW5nIGJhY2sgdG8gaHZtZW11bF9saW5lYXJf
bW1pb193cml0ZSgpLiBUaGlzIGlzIHdyb25nIGZvciB0aGUKcDJtX2lvcmVxX3NlcnZlciBzcGVj
aWFsIGNhc2UuIFRoYXQgY2hhbmdlIHdpZGVuZWQgYSBwcmUtZXhpc3RpbmcgaXNzdWUKdGhvdWdo
OiBPdGhlciB3cml0ZXMgdG8gc3VjaCBwYWdlcyBhbHNvIG5lZWQgdG8gYmUgZmFpbGVkIChvciBm
b3JjZWQKdGhyb3VnaCBlbXVsYXRpb24pLCBpbiBwYXJ0aWN1bGFyIGh5cGVyY2FsbCBidWZmZXIg
d3JpdGVzLgoKUmVwb3J0ZWQtYnk6ID8/PyA8Pz8/QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMzIwMiw2ICszMjAyLDEyIEBA
IHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19odm0KICAgICAgICAgaWYgKCBy
ZXMgIT0gSFZNVFJBTlNfb2theSApCiAgICAgICAgICAgICByZXR1cm4gcmVzOwogCisgICAgICAg
IGlmICggKGZsYWdzICYgSFZNQ09QWV90b19ndWVzdCkgJiYgcDJtdCA9PSBwMm1faW9yZXFfc2Vy
dmVyICkKKyAgICAgICAgeworICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7CisgICAgICAgICAg
ICByZXR1cm4gSFZNVFJBTlNfYmFkX2dmbl90b19tZm47CisgICAgICAgIH0KKwogICAgICAgICBw
ID0gKGNoYXIgKilfX21hcF9kb21haW5fcGFnZShwYWdlKSArIChhZGRyICYgflBBR0VfTUFTSyk7
CiAKICAgICAgICAgaWYgKCBmbGFncyAmIEhWTUNPUFlfdG9fZ3Vlc3QgKQoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
