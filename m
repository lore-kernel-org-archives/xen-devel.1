From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 for-4.11] kconfig: don't select VPCI if
 building a shim-only binary
Date: Tue, 27 Mar 2018 16:41:51 +0100
Message-ID: <20180327154151.sh5blwgbcfuabcot@MacBook-Pro-de-Roger.local>
References: <20180327153026.93720-1-roger.pau@citrix.com>
 <5ABA810902000078001B698C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jyqu=gr=citrix.com=prvs=617bf0025=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0qjW-0000rl-IU
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 15:41:58 +0000
Content-Disposition: inline
In-Reply-To: <5ABA810902000078001B698C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDk6MzY6MDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjAzLjE4IGF0IDE3OjMwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQWRkIGR1bW15IHJlcGxhY2VtZW50cyBmb3Igc29tZSBmdW5jdGlvbnMgdXNlZCBv
dXRzaWRlIG9mIHRoZSB2cGNpCj4gPiBjb2RlLCBhbmQgYWxzbyBhIGd1YXJkIGluIHZtc2kuYyB0
byBwcmV2ZW50IHZwY2kgYXJjaCBzcGVjaWZpYyBoZWxwZXJzCj4gPiBmcm9tIGJlaW5nIGNvbXBp
bGVkIGlmIHRoZSBvcHRpb24gaXMgbm90IHNlbGVjdGVkLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gd2l0aCBvbmUgcmVtYXJrOgo+IAo+ID4gK3N0YXRp
YyBpbmxpbmUgYm9vbCBfX211c3RfY2hlY2sgdnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZj
cHUgKnYpCj4gCj4gSSBkb24ndCB0aGluayB5b3UgcmVhbGx5IG5lZWQgdGhlIF9fbXVzdF9jaGVj
ayBoZXJlOyBpZiB5b3UgYWdyZWUsCj4gSSdtIHN1cmUgdGhpcyBjb3VsZCBiZSBkcm9wcGVkIHdo
aWxlIGNvbW1pdHRpbmcuCgpJJ3ZlIGtlZXAgdGhlIF9fbXVzdF9jaGVjayB0byBwcmV2ZW50IHVz
ZXJzIHRoYXQgZG9uJ3QgaGF2ZSBWUENJCmVuYWJsZWQgZnJvbSBhZGRpbmcgdXNhZ2VzIG9mIHZw
Y2lfcHJvY2Vzc19wZW5kaW5nIHRoYXQgZG9uJ3QgY2hlY2sKdGhlIHJldHVybiB2YWx1ZSwgYnV0
IFRCSCBJIGV4cGVjdCBwZW9wbGUgYWRkaW5nIG9yIGNoYW5naW5nIHVzYWdlcyBvZgp2cGNpX3By
b2Nlc3NfcGVuZGluZyB0byBoYXZlIFZQQ0kgZW5hYmxlZC4KCkknbSBmaW5lIHdpdGggeW91IHJl
bW92aW5nIHRoZSBfX211c3RfY2hlY2sgYXQgY29tbWl0IHRpbWUuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
