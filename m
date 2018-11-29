From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V10 5/5] p2m: change_type_range: Only
 invalidate mapped gfns
Date: Thu, 29 Nov 2018 03:07:10 -0700
Message-ID: <5BFFBA4E02000078002011B0@prv1-mh.provo.novell.com>
References: <1543442182-3557-1-git-send-email-rcojocaru@bitdefender.com>
 <1543442182-3557-6-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSJE2-0008Sm-6z
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 10:07:14 +0000
In-Reply-To: <1543442182-3557-6-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjExLjE4IGF0IDIyOjU2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gY2hhbmdlX3JhbmdlX3R5cGUoKSBpbnZhbGlkYXRlcyBnZm4gcmFuZ2VzIHRvIGxhemls
eSBjaGFuZ2UgdGhlIHR5cGUKPiBvZiBhIHJhbmdlIG9mIGdmbnMsIGFuZCBhbHNvIG1vZGlmaWVz
IHRoZSBsb2dkaXJ0eSByYW5nZXNldHMgb2YgdGhhdAo+IHAybS4gQXQgdGhlIG1vbWVudCwgaXQg
Y2xpcHMgYm90aCBkb3duIGJ5IHRoZSBob3N0cDJtLgo+IAo+IFdoaWxlIHRoaXMgd2lsbCByZXN1
bHQgaW4gY29ycmVjdCBiZWhhdmlvciwgaXQncyBub3QgZW50aXJlbHkgZWZmaWNpZW50LAo+IHNp
bmNlIGludmFsaWRhdGVkIGVudHJpZXMgb3V0c2lkZSB0aGF0IHJhbmdlIHdpbGwsIG9uIGZhdWx0
LCBzaW1wbHkgYmUKPiBtb2RpZmllZCBiYWNrIHRvICJlbXB0eSIgYmVmb3JlIGZhdWx0aW5nIG5v
cm1hbGx5IGFnYWluLgo+IAo+IFNlcGFyYXRlIG91dCB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIHR3
byByYW5nZXMuICBLZWVwIHVzaW5nIHRoZQo+IGhvc3RwMm0ncyBtYXhfbWFwcGVkX3BmbiB0byBj
bGlwIHRoZSBsb2dkaXJ0eSByYW5nZXMsIGJ1dCB1c2UgdGhlCj4gY3VycmVudCBwMm0ncyBtYXhf
bWFwcGVkX3BmbiB0byBmdXJ0aGVyIGNsaXAgdGhlIGludmFsaWRhdGlvbiByYW5nZQo+IGZvciBh
bHRlcm5hdGUgcDJtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29q
b2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gCj4gLS0tCj4gQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
ZXUuY2l0cml4LmNvbT4KPiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IEND
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IAo+IC0tLQo+IENoYW5nZXMgc2luY2UgVjk6Cj4gIC0gQ29ycmVjdGVk
IGZ1bmN0aW9uIG5hbWUgaW4gcGF0Y2ggc3ViamVjdC4KCkZ1bm55OiBJIGRpZG4ndCBldmVuIG5v
dGljZSB0aGUgaXNzdWUgaW4gdGhlIHBhdGNoIHRpdGxlLiBJIGhhZApwb2ludGVkIGl0IG91dCBh
Z2FpbnN0IHRoZSBzdGFydCBvZiB0aGUgZGVzY3JpcHRpb24sIHdoZXJlIGl0CnN0aWxsIGV4aXN0
cy4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
