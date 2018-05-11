From: Ian Jackson <ian.jackson@citrix.com>
Subject: staging-4.6 seems to be broken
Date: Fri, 11 May 2018 16:02:24 +0100
Message-ID: <23285.45184.391313.794468@mariner.uk.xensource.com>
References: <osstest-122657-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfka=h6=citrix.com=prvs=66292c996=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fH9Zl-00082C-0a
 for xen-devel@lists.xenproject.org; Fri, 11 May 2018 15:03:17 +0000
In-Reply-To: <osstest-122657-mainreport@xen.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTIy
NjU3OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTIyNjU3IHhlbi00LjYtdGVzdGlu
ZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncy8xMjI2NTcvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlk
IG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNv
dWxkIG5vdCBiZSBydW46Cj4gIHRlc3QteHRmLWFtZDY0LWFtZDY0LTIgNTAgeHRmL3Rlc3QtaHZt
NjQtbGJyLXRzeC12bWVudHJ5IGZhaWwgUkVHUi4gdnMuIDEyMjQ2MQo+ICB0ZXN0LWFtZDY0LWkz
ODYtbGlidmlydCAxOCBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDEy
MjQ2MQo+ICB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC14c20gMTggZ3Vlc3Qtc3RhcnQvZGViaWFu
LnJlcGVhdCBmYWlsIFJFR1IuIHZzLiAxMjI0NjEKPiAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQt
cWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAxNiBndWVzdC1zdGFydC9kZWJpYW5odm0ucmVwZWF0
IGZhaWwgUkVHUi4gdnMuIDEyMjQ2MQo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtZGViaWFu
aHZtLWFtZDY0LXNoYWRvdyAxNiBndWVzdC1sb2NhbG1pZ3JhdGUveDEwIGZhaWwgUkVHUi4gdnMu
IDEyMjQ2MQo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAxOCBndWVzdC1z
dGFydC9kZWJpYW5odm0ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDEyMjQ2MQoKQXQgbGVhc3Qgc29t
ZSBvZiB0aGVzZSBhcmUgc3VyZWx5IHJlYWwgcmVncmVzc2lvbnMuCgpJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
