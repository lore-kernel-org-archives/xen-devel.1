From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 4/6] ALSA: xen-front: Implement handling
 of shared buffers
Date: Thu, 17 May 2018 09:33:04 +0300
Message-ID: <847efda8-2b8e-fe71-454e-677566b7a825__17509.0267359794$1526538720$gmane$org@epam.com>
References: <20180514062742.25879-1-andr2000@gmail.com>
 <20180514062742.25879-5-andr2000@gmail.com> <s5ho9hi56ds.wl-tiwai@suse.de>
 <e37b5170-4fab-0c06-8902-730e57118ceb@gmail.com>
 <s5h8t8l5ufq.wl-tiwai@suse.de>
 <19a2c003-6730-265a-29aa-1eedd37147b9@epam.com>
 <s5ho9he94s7.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sudu=ie=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fJCTU-0003kT-I1
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 06:33:17 +0000
In-Reply-To: <s5ho9he94s7.wl-tiwai@suse.de>
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
Cc: Juergen Gross <jgross@suse.com>, alsa-devel@alsa-project.org, Oleksandr Andrushchenko <andr2000@gmail.com>, linux-kernel@vger.kernel.org, perex@perex.cz, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTcvMjAxOCAwOToyNiBBTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIFR1ZSwgMTUg
TWF5IDIwMTggMDg6MDI6MDggKzAyMDAsCj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
Cj4+IE9uIDA1LzE1LzIwMTggMDk6MDEgQU0sIFRha2FzaGkgSXdhaSB3cm90ZToKPj4+IE9uIFR1
ZSwgMTUgTWF5IDIwMTggMDc6NDY6MzggKzAyMDAsCj4+PiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToKPj4+PiBPbiAwNS8xNC8yMDE4IDExOjI4IFBNLCBUYWthc2hpIEl3YWkgd3JvdGU6
Cj4+Pj4+IE9uIE1vbiwgMTQgTWF5IDIwMTggMDg6Mjc6NDAgKzAyMDAsCj4+Pj4+IE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+Pj4gKysrIGIv
c291bmQveGVuL3hlbl9zbmRfZnJvbnRfc2hidWYuYwo+Pj4+Pj4gQEAgLTAsMCArMSwxOTMgQEAK
Pj4+Pj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBPUiBNSVQKPj4+Pj4+
ICsKPj4+Pj4+ICsvKgo+Pj4+Pj4gKyAqIFhlbiBwYXJhLXZpcnR1YWwgc291bmQgZGV2aWNlCj4+
Pj4+PiArICoKPj4+Pj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTYtMjAxOCBFUEFNIFN5c3RlbXMg
SW5jLgo+Pj4+Pj4gKyAqCj4+Pj4+PiArICogQXV0aG9yOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pj4+PiArICovCj4+Pj4+PiAr
Cj4+Pj4+PiArI2luY2x1ZGUgPHhlbi94ZW4uaD4KPj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3hlbmJ1
cy5oPgo+Pj4+Pj4gKwo+Pj4+Pj4gKyNpbmNsdWRlICJ4ZW5fc25kX2Zyb250X3NoYnVmLmgiCj4+
Pj4+IEhtLCB3aXRoIHRoZSBsb2NhbCBidWlsZCB0ZXN0LCBJIGdldCB0aGUgZm9sbG93aW5nIGVy
cm9yOgo+Pj4+Pgo+Pj4+PiAgICAgIENDIFtNXSAgc291bmQveGVuL3hlbl9zbmRfZnJvbnRfc2hi
dWYubwo+Pj4+PiAgICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBzb3VuZC94ZW4veGVuX3NuZF9m
cm9udF9zaGJ1Zi5jOjExOjA6Cj4+Pj4+ICAgICAgLi9pbmNsdWRlL3hlbi94ZW4uaDoxODo4OiBl
cnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYYm9vbOKAmQo+Pj4+PiAgICAgICBleHRlcm4gYm9v
bCB4ZW5fcHZoOwo+Pj4+PiAgICAgICAgICAgICAgIF5+fn4KPj4+Pj4gICAgICAgSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC4vaW5jbHVkZS94ZW4vaW50ZXJmYWNlL3hlbi5oOjMwOjAsCj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUveGVuL3hlbi5oOjI5LAo+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgIGZyb20gc291bmQveGVuL3hlbl9zbmRfZnJvbnRfc2hidWYu
YzoxMToKPj4+Pj4gICAgICAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaDo5
MjoyMTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVpbnQ2NF904oCZCj4+Pj4+ICAgICAg
IERFRklORV9HVUVTVF9IQU5ETEUodWludDY0X3QpOwo+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPj4+Pj4gCQkJCj4+Pj4+IEFkZGluZyAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+
IGZpeGVkIHRoZSBpc3N1ZS4KPj4+Pj4KPj4+Pj4gRGlkIHlvdSByZWFsbHkgdGVzdCB5b3VyIHBh
dGNoZXMgd2l0aCB0aGUgbGF0ZXN0IExpbnVzIHRyZWU/Cj4+Pj4gTXkgYmFkLCBpdCBkb2VzIGJ1
aWxkIGZvciBBUk0gKHdoaWNoIGlzIG15IHRhcmdldCksIGJ1dCBhbHNvIGRvZXMKPj4+PiBuZWVk
ICIjaW5jbHVkZSA8bGludXgva2VybmVsLmg+IiBmb3IgeDg2IHdoaWNoIEkgZGlkbid0IGJ1aWxk
IHRoaXMgdGltZS4KPj4+PiBTb3JyeSBhYm91dCB0aGF0Lgo+Pj4+Cj4+Pj4gRG8geW91IHdhbnQg
bWUgdG8gcmVzZW5kIHRoaXMgc2luZ2xlIHBhdGNoIG9yIHlvdSBjYW4gbWFrZSB0aGUgY2hhbmdl
Cj4+Pj4gd2hpbGUgYXBwbHlpbmc/Cj4+PiBZZXMsIGl0J3MgZmluZS4KPj4gVGhhbmsgeW91Cj4g
RldJVywgdGhlIHBhdGNoZXMgYXJlIGluIHRvcGljL3hlbiBicmFuY2ggaW4gc291bmQuZ2l0IHRy
ZWUsIGFuZCBJJ2xsCj4ga2VlcCBib2lsaW5nIGZvciBhIHdoaWxlIHRvIHNlZSBpZiBhbnkgaXNz
dWVzIGFyZSBjYXVnaHQgYnkgMGRheSBib3QuClRoYW5rIHlvdSwgaG9wZSBldmVyeXRoaW5nIGdv
ZXMgd2VsbAo+Cj4gVGFrYXNoaQpUaGFuayB5b3UsCk9sZWtzYW5kcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
