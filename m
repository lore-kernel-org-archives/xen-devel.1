From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.12] pvh/dom0: fix deadlock in GSI
 mapping
Date: Mon, 28 Jan 2019 16:52:36 +0100
Message-ID: <20190128155236.zheuammgnwivufuf@mac>
References: <20190128142245.34923-1-roger.pau@citrix.com>
 <5C4F1FFA0200007800211CE9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E7Vy=QE=citrix.com=prvs=924d4b44a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1go9Dc-0002TG-He
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 15:53:04 +0000
Content-Disposition: inline
In-Reply-To: <5C4F1FFA0200007800211CE9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMDg6MzA6MDJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjAxLjE5IGF0IDE1OjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gSW4gb3JkZXIgdG8gc29sdmUgaXQgbW92ZSB0aGUgdmlvYXBpY19od2RvbV9tYXBf
Z3NpIG91dHNpZGUgb2YgdGhlCj4gPiBsb2NrZWQgcmVnaW9uIGluIHZpb2FwaWNfd3JpdGVfcmVk
aXJlbnQuIHZpb2FwaWNfaHdkb21fbWFwX2dzaSB3aWxsCj4gPiBub3QgYWNjZXNzIGFueSBvZiB0
aGUgdmlvYXBpYyBmaWVsZHMsIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBjYWxsIHRoZQo+ID4gZnVu
Y3Rpb24gaG9sZGluZyB0aGUgaHZtLmlycV9sb2NrLgo+IAo+IFRydWUsIGJ1dCB5b3UgYWxzbyBt
b3ZlIHRoZSBjb2RlIGFjcm9zcyBhIHZpb2FwaWNfZGVsaXZlcigpCj4gaW52b2NhdGlvbi4gSXMg
dGhhdCBkZWxpdmVyeSBnb2luZyB0byB3b3JrIHdoZW4KPiB2aW9hcGljX2h3ZG9tX21hcF9nc2ko
KSBnZXRzIGludm9rZWQgb25seSBhZnRlcndhcmRzPwoKWWVzLCB0aGF0IHZpb2FwaWNfZGVsaXZl
ciB3aWxsIG9ubHkgZ2V0IGludm9rZWQgd2hlbiB0aGVyZSdzIGEgcGVuZGluZwpnc2kgKGh2bV9p
cnEtPmdzaV9hc3NlcnRfY291bnRbaWR4XSA+IDApLCBhbmQgdGhhdCBjYW4gb25seSBoYXBwZW4K
b25jZSB0aGUgaGFyZHdhcmUgZ3NpIGlzIGJvdW5kIHRvIGRvbTAgYW5kIHRoZSBodm0uaXJxX2xv
Y2sgaGFzIGJlZW4KcmVsZWFzZWQsIHNvIHRoYXQgdGhlIGRwY2kgc29mdGlycSBjYW4gaW5jcmVh
c2UgdGhlIGdzaSBhc3NlcnQgY291bnQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
