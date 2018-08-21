From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 30/34] x86: PIT emulation is common to PV
 and HVM
Date: Tue, 21 Aug 2018 05:43:50 -0600
Message-ID: <5B7BFAF602000078001E0722@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <ff0a741aa240f10a4d113db25e6df9f43f48f6f3.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs54l-0000HJ-SA
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 11:43:55 +0000
In-Reply-To: <ff0a741aa240f10a4d113db25e6df9f43f48f6f3.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
TW92ZSB0aGUgY29tbW9uIHBhcnRzIHRvIGVtdWwtaTgyNTQuYy4gVGhpcyByZXF1aXJlcyBtb3Zp
bmcgc29tZSBvZgo+IHRoZSBtYWNyb3MgdG8gdnB0LmguIFNvbWUgb2YgdGhlIGNvZGUgaW4gY29t
bW9uIGNvZGUgaXMgcHV0IHVuZGVyCj4gaXNfaHZtXyogY2hlY2tzIHNvIHRoYXQgRENFIGNhbiBr
aWNrIGluLiBGYWN0b3Igb3V0IEhWTSBvbmx5Cj4gcGl0X2xvYWRfY291bnRfY2hhbm5lbDAgdG8g
cmVkdWNlIGFtb3VudCBvZiBjb2RlIGluIHg4NiBjb21tb24gY29kZS4KPiAKPiBMZWF2ZSBIVk0g
c3BlY2lmaWMgY29kZSB3aGVyZSBpdCB3YXMgYmVmb3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9NYWtlZmls
ZSAgICAgICAgIHwgICAxICstCj4gIHhlbi9hcmNoL3g4Ni9lbXVsLWk4MjU0LmMgICAgIHwgNTA2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICB4ZW4vYXJjaC94ODYvaHZt
L2k4MjU0LmMgICAgICB8IDQ2MiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCldo
ZW4gdGhlIGZpbGUgYXMgYSB3aG9sZSBpcyA2MDAgbGluZXMsIEkgdGhpbmsgSSBhZ3JlZSB3aXRo
IFJvZ2VyCnRoYXQgbW92aW5nIHRoZSBlbnRpcmUgZmlsZSAoYW5kIGFkZGluZyBzb21lICNpZmRl
Zi1hcnkpIGlzCnByb2JhYmx5IGJldHRlciwgYW5kIGF2b2lkcyBleHBvc2luZyBpbnRlcm5hbHMg
dGhyb3VnaCB2cHQuaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
