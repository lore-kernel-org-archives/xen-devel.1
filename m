From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/9] Per vcpu vm_event channels
Date: Fri, 31 May 2019 17:25:27 -0700
Message-ID: <36fe4bc2-06ba-41aa-59ed-d365837dd9d0@citrix.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fs4O=UA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWrq8-0000Ad-KP
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 00:25:40 +0000
In-Reply-To: <cover.1559224640.git.ppircalabu@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMjAxOSAwNzoxOCwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOgo+IFRoaXMgcGF0Y2hz
ZXQgYWRkcyBhIG5ldyBtZWNoYW5pc20gb2Ygc2VuZGluZyBzeW5jaHJvbm91cyB2bV9ldmVudAo+
IHJlcXVlc3RzIGFuZCBoYW5kbGluZyB2bV9ldmVudCByZXNwb25zZXMgd2l0aG91dCB1c2luZyBh
IHJpbmcuCj4gQXMgZWFjaCBzeW5jaHJvbm91cyByZXF1ZXN0IHBhdXNlcyB0aGUgdmNwdSB1bnRp
bCB0aGUgY29ycmVzcG9uZGluZwo+IHJlc3BvbnNlIGlzIGhhbmRsZWQsIGl0IGNhbiBiZSBzdG9y
ZWQgaW4gYSBzbG90dGVkIG1lbW9yeSBidWZmZXIKPiAob25lIHBlciB2Y3B1KSBzaGFyZWQgYmV0
d2VlbiB0aGUgaHlwZXJ2aXNvciBhbmQgdGhlIGNvbnRyb2xsaW5nIGRvbWFpbi4KPgo+IFRoZSBt
YWluIGFkdmFudGFnZXMgb2YgdGhpcyBhcHByb2FjaCBhcmU6Cj4gLSB0aGUgYWJpbGl0eSB0byBk
eW5hbWljYWx5IGFsbG9jYXRlIHRoZSBuZWNlc3NhcnkgbWVtb3J5IHVzZWQgdG8gaG9sZAo+IHRo
ZSByZXF1ZXN0cy9yZXNwb25zZXMgKHRoZSBzaXplIG9mIHZtX2V2ZW50X3JlcXVlc3RfdC92bV9l
dmVudF9yZXNwb25zZV90Cj4gY2FuIGdyb3cgdW5yZXN0cmljdGVkIGJ5IHRoZSByaW5nJ3Mgb25l
IHBhZ2UgbGltaXRhdGlvbikKPiAtIHRoZSByaW5nJ3Mgd2FpdHF1ZXVlIGxvZ2ljIGlzIHVubmVj
ZXNzYXJ5IGluIHRoaXMgY2FzZSBiZWNhdXNlIHRoZQo+IHZjcHUgc2VuZGluZyB0aGUgcmVxdWVz
dCBpcyBibG9ja2VkIHVudGlsIGEgcmVzcG9uc2UgaXMgcmVjZWl2ZWQuCj4KCkJlZm9yZSBJIHJl
dmlldyBwYXRjaGVzIDctOSBmb3IgbW9yZSB0aGFuIHN0eWxpc3RpYyB0aGluZ3MsIGNhbiB5b3UK
YnJpZWZseSBkZXNjcmliZSB3aGF0J3MgbmV4dD8KCkFGQUNULCB0aGlzIGludHJvZHVjZXMgYSBz
ZWNvbmQgaW50ZXJmYWNlIGJldHdlZW4gWGVuIGFuZCB0aGUgYWdlbnQsCndoaWNoIGlzIGxpbWl0
ZWQgdG8gc3luY2hyb25vdXMgZXZlbnRzIG9ubHksIGFuZCBleGNsdXNpdmVseSB1c2VzCnNsb3R0
ZWQgc3lzdGVtIHBlciB2Y3B1LCB3aXRoIGEgcGVyLXZjcHUgZXZlbnQgY2hhbm5lbD8KCldoYXQg
KGlmIGFueSkgYXJlIHRoZSBmdXR1cmUgZGV2ZWxvcG1lbnQgcGxhbnMsIGFuZCB3aGF0IGFyZSB0
aGUgcGxhbnMKZm9yIGRlcHJlY2F0aW5nIHRoZSB1c2Ugb2YgdGhlIG9sZCBpbnRlcmZhY2U/wqAg
KFRoZSBhbnN3ZXJzIHRvIHRoZXNlCndpbGwgYWZmZWN0IG15IHJldmlldyBvZiB0aGUgbmV3IGlu
dGVyZmFjZSkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
