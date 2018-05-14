From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [alsa-devel] [PATCH v3 0/6] ALSA: xen-front: Add
 Xen para-virtualized frontend driver
Date: Mon, 14 May 2018 19:08:56 +0300
Message-ID: <096bee8c-69ad-b1ca-5eb6-370203d73c16__32964.7575425499$1526314072$gmane$org@gmail.com>
References: <20180514062742.25879-1-andr2000@gmail.com>
 <s5hmux2s08m.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o5vb=ib=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fIG22-0005K5-2C
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:09:02 +0000
Received: by mail-lf0-x244.google.com with SMTP id b18-v6so18139947lfa.9
 for <xen-devel@lists.xenproject.org>; Mon, 14 May 2018 09:09:00 -0700 (PDT)
In-Reply-To: <s5hmux2s08m.wl-tiwai@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: jgross@suse.com, alsa-devel@alsa-project.org, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, linux-kernel@vger.kernel.org, perex@perex.cz, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTQvMjAxOCAwNjo1MiBQTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIE1vbiwgMTQg
TWF5IDIwMTggMDg6Mjc6MzYgKzAyMDAsCj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
Cj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4KPj4KPj4gUGxlYXNlIG5vdGU6IHRoaXMgcGF0Y2ggc2VyaWVzIGRlcGVuZHMg
b24gWzNdLgo+Pgo+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIFhlbiBbMV0g
cGFyYS12aXJ0dWFsaXplZAo+PiBzb3VuZCBmcm9udGVuZCBkcml2ZXIuIEl0IGltcGxlbWVudHMg
dGhlIHByb3RvY29sIGZyb20KPj4gaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3NuZGlmLmggd2l0
aCB0aGUgZm9sbG93aW5nIGxpbWl0YXRpb25zOgo+PiAtIG11dGUvdW5tdXRlIGlzIG5vdCBzdXBw
b3J0ZWQKPj4gLSBnZXQvc2V0IHZvbHVtZSBpcyBub3Qgc3VwcG9ydGVkCj4+IFZvbHVtZSBjb250
cm9sIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIHRoZSByZWFzb24gdGhhdCBtb3N0IG9mIHRoZQo+PiB1
c2UtY2FzZXMgKGF0IHRoZSBtb21lbnQpIGFyZSBiYXNlZCBvbiBzY2VuYXJpb3VzIHdoZXJlCj4+
IHVucHJpdmlsZWdlZCBPUyAoZS5nLiBBbmRyb2lkLCBBR0wgZXRjKSB1c2Ugc29mdHdhcmUgbWl4
ZXJzLgo+Pgo+PiBCb3RoIGNhcHR1cmUgYW5kIHBsYXliYWNrIGFyZSBzdXBwb3J0ZWQuCj4+Cj4+
IENvcnJlc3BvbmRpbmcgYmFja2VuZCwgaW1wbGVtZW50ZWQgYXMgYSB1c2VyLXNwYWNlIGFwcGxp
Y2F0aW9uLCBjYW4gYmUKPj4gZm91bmQgYXQgWzJdLgo+IFRocm91Z2ggYSBxdWljayBnbGFuY2Us
IGFsbCBsb29rIE9LIGZvciBtZXJnZSAoYXNzdW1pbmcgdGhhdCB0aGV5Cj4gcmVhbGx5IHdvcmsg
b24geW91ciBzeXN0ZW1zIDopCldlbGwsIHdlIGhhdmUgdGVzdGVkIHRoaXMgYXQgRVBBTSBvbiBB
bmRyb2lkL0xpbnV4LCBzbyB0aGlzIGlzIGl0IGZvciBub3cKPgo+IE9mIGNvdXJzZSwgaXQnZCBi
ZSBncmVhdCBpZiBhbnlvbmUgZWxzZSBjYW4gcmV2aWV3LCB0ZXN0IGFuZCBnaXZlCj4gcmV2aWV3
ZWQtYnkgb3IgdGVzdGVkLWJ5IHRhZ3MuCkkgaG9wZSBKdWVyZ2VuIGFuZCBCb3JpcyBjYW4gcmV2
aWV3LCBhdCBsZWFzdCBKdWVyZ2VuIGhhZCBzb21lIGNvbW1lbnRzCnRoYXQgSSBoYXZlIGFkZHJl
c3NlZCBpbiB2Mwo+ICAgIFNvIEknbGwga2VlcCB0aGlzIGZsb2F0aW5nIGZvciBhCj4gY291cGxl
IG9mIGRheXMgYW5kIG1lcmdlIHRvIGZvci1uZXh0IGJyYW5jaCBhZnRlciB0aGF0LgpPaCwgdGhp
cyBpcyBncmVhdCBuZXdzISBUaGFuayB5b3UKPgo+IHRoYW5rcywKPgo+IFRha2FzaGkKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
