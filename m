From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] x86/AMD: flush TLB after ucode update
Date: Mon, 28 Jan 2019 13:13:08 +0100
Message-ID: <07f8e0e0-dd52-0c10-ee8e-7116eb586045@suse.com>
References: <5C4ED0A302000078002119D5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1go5mq-0005qM-IO
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 12:13:12 +0000
In-Reply-To: <5C4ED0A302000078002119D5@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDEvMjAxOSAxMDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGluY3JlYXNlZCBu
dW1iZXIgb2YgbWVzc2FnZXMgKHNwZWNfY3RybC5jOnByaW50X2RldGFpbHMoKSkgd2l0aGluIGEK
PiBjZXJ0YWluIHRpbWUgd2luZG93IG1hZGUgbWUgbm90aWNlIHNvbWUgc2xvd25lc3Mgb2YgYm9v
dCB0aW1lIHNjcmVlbgo+IG91dHB1dC4gRXhwZXJpbWVudGFsbHkgSSd2ZSBuYXJyb3dlZCB0aGUg
dGltZSB3aW5kb3cgdG8gYmUgZnJvbQo+IGltbWVkaWF0ZWx5IGFmdGVyIHRoZSBlYXJseSB1Y29k
ZSB1cGRhdGUgb24gdGhlIEJTUCB0byB0aGUgUEFUIHdyaXRlIGluCj4gY3B1X2luaXQoKSwgd2hp
Y2ggdXBvbiBmdXJ0aGVyIGludmVzdGlnYXRpb24gaGFzIGFuIGVmZmVjdCBiZWNhdXNlIG9mCj4g
dGhlIGZ1bGwgVExCIGZsdXNoIHRoYXQncyBpbXBsaWVkIGJ5IHRoYXQgd3JpdGUuCj4gCj4gRm9y
IHRoYXQgcmVhc29uLCBhcyBhIHdvcmthcm91bmQsIGZsdXNoIHRoZSBUTEIgb2YgdGhlIG1hcHBp
bmcgb2YgdGhlCj4gcGFnZSB0aGF0IGhvbGRzIHRoZSBibG9iLiBOb3RlIHRoYXQgZmx1c2hpbmcg
anVzdCBhIHNpbmdsZSBwYWdlIGlzCj4gc3VmZmljaWVudDogQXMgcGVyIHZlcmlmeV9wYXRjaF9z
aXplKCkgcGF0Y2ggc2l6ZSBjYW4ndCBleGNlZWQgNGssIGFuZAo+IHRoZSB3YXkgeG1hbGxvYygp
IHdvcmtzIHRoZSBibG9iIGNhbid0IGJlIGNyb3NzaW5nIGEgcGFnZSBib3VuZGFyeS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
