From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 0/8] PVH MTRR initial state
Date: Tue, 03 Jul 2018 03:50:41 -0600
Message-ID: <5B3B46F102000078001D01D6@prv1-mh.provo.novell.com>
References: <20180608095934.20995-1-roger.pau@citrix.com>
 <20180703081707.j2wrvlcyw7ld3ieu@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uib8=jt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1faHxN-0007wR-8j
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 09:50:45 +0000
In-Reply-To: <20180703081707.j2wrvlcyw7ld3ieu@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDEwOjE3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgSnVuIDA4LCAyMDE4IGF0IDExOjU5OjI2QU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToKPj4gSGVsbG8sCj4+IAo+PiBUaGUgZm9sbG93aW5nIHBhdGNoZXMgc2V0IGEgc2Fu
ZSBpbml0aWFsIE1UUlIgc3RhdGUgZm9yIGJvdGggRG9tMCBhbmQKPj4gRG9tVSBQVkggZ3Vlc3Rz
LiBOb3RlIHRoYXQgZm9yIERvbTAgdGhlIGhvc3QgTVRSUiBzdGF0ZSBpcyB1c2VkLCBPVE9ICj4+
IGZvciBEb21VIHRoZSBkZWZhdWx0IE1UUlIgdHlwZSBpcyBzZXQgdG8gd3JpdGUtYmFjay4KPj4g
Cj4+IFRoaXMgc2hvdWxkIGF2b2lkIGd1ZXN0cyBoYXZpbmcgdG8gc2V0dXAgc29tZSBraW5kIG9m
IE1UUlIgc3RhdGUgaW4KPj4gb3JkZXIgdG8gYm9vdC4KPj4gCj4+IFRoaXMgaGFzIGJlZW4gcmVi
YXNlZCBvbiB0b3Agb2YgYSBjb3VwbGUgb2YgZml4ZXMvaW1wcm92ZW1lbnRzIGZyb20gSmFuLAo+
PiB3aGljaCBhcmUgYWxzbyBpbmNsdWRlZCBpbiB0aGUgc2VyaWVzLgo+PiAKPj4gVGhhbmtzLCBS
b2dlci4KPj4gCj4+IEphbiBCZXVsaWNoICgyKToKPj4gICB4ODYvSFZNOiBpbXByb3ZlIE1UUlIg
bG9hZCBjaGVja3MKPj4gICB4ODYvbXRycjogc3BsaXQgImVuYWJsZWQiIGZpZWxkIGludG8gdHdv
IGJvb2xlYW4gZmxhZ3MKPj4gCj4+IFJvZ2VyIFBhdSBNb25uZSAoNik6Cj4+ICAgbXRycjogaW50
cm9kdWNlIG1hc2sgdG8gZ2V0IFZDTlQgZnJvbSBNVFJSY2FwIE1TUgo+PiAgIGh2bS9tdHJyOiBh
ZGQgZW1hY3MgbG9jYWwgdmFyaWFibGVzIGJsb2NrIHdpdGggZm9ybWF0dGluZyBpbmZvCj4+ICAg
aHZtL210cnI6IHVzZSB0aGUgaGFyZHdhcmUgbnVtYmVyIG9mIHZhcmlhYmxlIHJhbmdlcyBmb3Ig
RG9tMAo+PiAgIGh2bS9tdHJyOiBjb3B5IGhhcmR3YXJlIHN0YXRlIGZvciBEb20wCj4+ICAgbGli
eGMvcHZoOiBzZXQgZGVmYXVsdCBNVFJSIHR5cGUgdG8gd3JpdGUtYmFjawo+PiAgIGRvY3MvcHZo
OiBkb2N1bWVudCBpbml0aWFsIE1UUlIgc3RhdGUKPiAKPiBIZWxsbywKPiAKPiBQYXRjaGVzICMy
LCAjMywgIzQgYW5kICM4IGRvbid0IGhhdmUgYW55IHJldmlld3MgeWV0LgoKSSBkb24ndCB0aGlu
ayAjNCBuZWVkcyBhbnkgcmV2aWV3LiBJZiBJIHdhcyB0byBjb21taXQgdGhlIHNlcmllcyAoaS5l
LiBpZgpBbmRyZXcgZ2F2ZSBhbiBhY2sgb24gIzIgYW5kICMzKSBJJ2QgcHV0IHRoaXMgaW4gd2l0
aG91dCBhbnkgZnVydGhlcgp0YWdzLiBJJ3ZlIGJlZW4gY29uc2lkZXJpbmcgdGhlIHNhbWUgZm9y
ICM4LgoKQnV0IGNvbW1pdHRpbmcgd2lsbCBoYXZlIHRvIHdhaXQgYW55d2F5IHVudGlsIGFmdGVy
IDQuMTEgd2FzIHRhZ2dlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
