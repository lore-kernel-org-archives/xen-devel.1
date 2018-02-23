From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: set channel devid when not provided
	by application
Date: Fri, 23 Feb 2018 18:26:54 +0000
Message-ID: <20180223182654.6lv3oabr5gvphbvz@citrix.com>
References: <20180208030410.1353-1-jfehlig@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=se9o=fr=citrix.com=prvs=5854c8178=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1epI3i-0008LM-Hj
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 18:27:02 +0000
Content-Disposition: inline
In-Reply-To: <20180208030410.1353-1-jfehlig@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jim Fehlig <jfehlig@suse.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMDcsIDIwMTggYXQgMDg6MDQ6MTBQTSAtMDcwMCwgSmltIEZlaGxpZyB3cm90
ZToKPiBBcHBsaWNhdGlvbnMgbGlrZSBsaWJ2aXJ0IG1heSBub3QgcG9wdWxhdGUgYSBkZXZpY2Ug
ZGV2aWQgZmllbGQsCj4gZGVsZWdhdGluZyB0aGF0IHRvIGxpYnhsLiBJZiBuZWVkZWQsIHRoZSBh
cHBsaWNhdGlvbiBjYW4gbGF0ZXIKPiByZXRyaWV2ZSB0aGUgbGlieGwtcHJvZHVjZWQgZGV2aWQu
IEluZGVlZCBtb3N0IGRldmljZXMgYXJlIGhhbmRsZWQKPiB0aGlzIHdheSBpbiBsaWJ2aXJ0LCBj
aGFubmVsIGRldmljZXMgaW5jbHVkZWQuCj4gCj4gVGhpcyB3b3JrcyB3ZWxsIHdoZW4gb25seSBv
bmUgY2hhbm5lbCBkZXZpY2UgaXMgZGVmaW5lZCwgYnV0IG1vcmUKPiB0aGFuIG9uZSByZXN1bHRz
IGluCj4gCj4gcWVtdS1zeXN0ZW0taTM4NjogLWNoYXJkZXYgc29ja2V0LGlkPWxpYnhsLWNoYW5u
ZWwtMSxcCj4gcGF0aD0vdG1wL3Rlc3Qtb3JnLnFlbXUuZ3Vlc3RfYWdlbnQuMDAsc2VydmVyLG5v
d2FpdDoKPiBEdXBsaWNhdGUgSUQgJ2xpYnhsLWNoYW5uZWwtMScgZm9yIGNoYXJkZXYKPiAKPiBC
ZXNpZGVzIHRoZSBvZGQgJy0xJyB2YWx1ZSBpbiB0aGUgaWQsIG11bHRpcGxlIGNoYW5uZWxzIGhh
dmUgdGhlIHNhbWUKPiBpZCwgY2F1c2luZyBxZW11IHRvIGZhaWwuIEEgc2ltcGxlIGZpeCBpcyB0
byBzZXQgYW4gdW5pbml0aWFsaXplZAo+IGRldmlkICgtMSkgdG8gdGhlIGRldl9udW0gcGFzc2Vk
IHRvIGxpYnhsX19pbml0X2NvbnNvbGVfZnJvbV9jaGFubmVsKCkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmltIEZlaGxpZyA8amZlaGxpZ0BzdXNlLmNvbT4KPiAtLS0KPiAKPiBJIGdldCB0aGUgZmVl
bGluZyB0aGF0IGlmIG5lZWRlZCBkZXZpZCBzaG91bGQgYmUgc2V0IGVhcmxpZXIsIGJ1dAo+IHRo
aXMgc2VlbXMgbGlrZSB0aGUgbW9zdCBvcHBvcnR1bmUgc3BvdC4gU3VnZ2VzdGlvbnMgZm9yIGlt
cHJvdmVtZW50cwo+IHdlbGNvbWUuCgpJIHRoaW5rIHRoaXMgYXBwcm9hY2ggaXMgZmluZS4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
