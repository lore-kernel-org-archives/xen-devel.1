From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/misc/xenpm: fix getting info when
 some CPUs are offline
Date: Tue, 30 Oct 2018 22:29:08 +0000
Message-ID: <a961e40e-4844-16ea-0693-db8f6c026223@citrix.com>
References: <20181030221615.24171-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o/ya=nk=citrix.com=prvs=8340f39c5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gHcVh-0001O8-1B
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 22:29:17 +0000
In-Reply-To: <20181030221615.24171-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMTAvMjAxOCAyMjoxNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IFVzZSBwaHlzaW5mby5tYXhfY3B1X2lkIGluc3RlYWQgb2YgcGh5c2luZm8ubnJfY3B1cyB0byBn
ZXQgbWF4IENQVSBpZC4KPiBUaGlzIGZpeGVzIGZvciBleGFtcGxlICd4ZW5wbSBnZXQtY3B1ZnJl
cS1wYXJhJyB3aXRoIHNtdD1vZmYsIHdoaWNoCj4gb3RoZXJ3aXNlIHdvdWxkIG1pc3MgaGFsZiBv
ZiB0aGUgY29yZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gLS0tCj4gUmVwb3J0ZWQgYnkg
QHRmbTE6Cj4gaHR0cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtaXNzdWVzL2lzdWVzLzQ0
NTYKClRoYXRzIGEgNDA0LCBidXQgL2lzc3Vlcy8gbG9va3MgdG8gd29yay4KCkVpdGhlciB3YXks
IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
PiAtLS0KPiAgdG9vbHMvbWlzYy94ZW5wbS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9taXNjL3hl
bnBtLmMgYi90b29scy9taXNjL3hlbnBtLmMKPiBpbmRleCA4NmMxMmVhNWZiLi4xMTI1OTBmYjY3
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL21pc2MveGVucG0uYwo+ICsrKyBiL3Rvb2xzL21pc2MveGVu
cG0uYwo+IEBAIC0xMjMxLDcgKzEyMzEsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJn
dltdKQo+ICAgICAgICAgIHhjX2ludGVyZmFjZV9jbG9zZSh4Y19oYW5kbGUpOwo+ICAgICAgICAg
IHJldHVybiByZXQ7Cj4gICAgICB9Cj4gLSAgICBtYXhfY3B1X25yID0gcGh5c2luZm8ubnJfY3B1
czsKPiArICAgIG1heF9jcHVfbnIgPSBwaHlzaW5mby5tYXhfY3B1X2lkOwo+ICAKPiAgICAgIC8q
IGNhbGN1bGF0ZSBob3cgbWFueSBvcHRpb25zIG1hdGNoIHdpdGggdXNlcidzIGlucHV0ICovCj4g
ICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUobWFpbl9vcHRpb25zKTsgaSsrICkKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
