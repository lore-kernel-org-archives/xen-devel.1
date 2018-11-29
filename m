From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] pvcalls-front: Use GFP_ATOMIC under
 spin_lock
Date: Thu, 29 Nov 2018 18:01:46 +0100
Message-ID: <074547f7-6a9c-6bef-30e7-0f69e66b912a__36581.3158489347$1543510831$gmane$org@suse.com>
References: <20181129120101.19678-1-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jnsg=OI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gSPhG-0005qP-7l
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 17:01:50 +0000
In-Reply-To: <20181129120101.19678-1-wen.yang99@zte.com.cn>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wen Yang <wen.yang99@zte.com.cn>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, zhong.weidong@zte.com.cn, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMTEvMjAxOCAxMzowMSwgV2VuIFlhbmcgd3JvdGU6Cj4gVGhlIHByb2JsZW0gaXMgdGhh
dCB3ZSBjYWxsIHRoaXMgd2l0aCBhIHNwaW4gbG9jayBoZWxkLgo+IFRoZSBjYWxsIHRyZWUgaXM6
Cj4gcHZjYWxsc19mcm9udF9hY2NlcHQoKSBob2xkcyBiZWRhdGEtPnNvY2tldF9sb2NrLgo+ICAg
ICAtPiBjcmVhdGVfYWN0aXZlKCkKPiAgICAgICAgIC0+IF9fZ2V0X2ZyZWVfcGFnZXMoKSB1c2Vz
IEdGUF9LRVJORUwKPiAKPiBUaGUgY3JlYXRlX2FjdGl2ZSgpIGZ1bmN0aW9uIGlzIG9ubHkgY2Fs
bGVkIGZyb20gcHZjYWxsc19mcm9udF9hY2NlcHQoKQo+IHdpdGggYSBzcGluX2xvY2sgaGVsZCwg
VGhlIGFsbG9jYXRpb24gaXMgbm90IGFsbG93ZWQgdG8gc2xlZXAgYW5kCj4gR0ZQX0tFUk5FTCBp
cyBub3Qgc3VmZmljaWVudCwgaXQgaGFzIHRvIGJlIEFUT01JQy4KCkknZCByYXRoZXIgaGF2ZSBh
IGZ1bmN0aW9uIGRvaW5nIHRoZSBhbGxvY2F0aW9ucyB3aGljaCBpcyBjYWxsZWQKb3V0c2lkZSB0
aGUgbG9jayBhbmQgZWl0aGVyIHBhc3NpbmcgdGhlIGFsbG9jYXRlZCBkYXRhIHRvCmNyZWF0ZV9h
Y3RpdmUoKSBvciBob29rIGl0IGludG8gbWFwIGluIHRoZSBhbGxvY2F0aW9uIGZ1bmN0aW9uLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
