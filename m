From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] new config option vtsc_khz_tolerance to
 avoid TSC emulation
Date: Mon, 5 Mar 2018 14:46:33 +0000
Message-ID: <ed59633c-a6af-ada6-1bad-b63bf2f4ddca@citrix.com>
References: <20180305113555.8467-1-olaf@aepfle.de>
 <5A9D51A902000078001AE868@prv-mh.provo.novell.com>
 <20180305151835.6d36d52e.olaf@aepfle.de>
 <5A9D661402000078001AE986@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9D661402000078001AE986@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDUvMjAxOCAwMjo0NSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMDMu
MTggYXQgMTU6MTgsIDxvbGFmQGFlcGZsZS5kZT4gd3JvdGU6Cj4+IEFtIE1vbiwgMDUgTWFyIDIw
MTggMDY6MTg6MTcgLTA3MDAKPj4gc2NocmllYiAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT46Cj4+Cj4+Pj4+PiBPbiAwNS4wMy4xOCBhdCAxMjozNSwgPG9sYWZAYWVwZmxlLmRlPiB3
cm90ZTogIAo+Pj4+ICsgICAgY2FzZSBYRU5fRE9NQ1RMX3NldF92dHNjX2toel90b2xlcmFuY2U6
Cj4+Pj4gKyAgICAgICAgaWYgKCBkID09IGN1cnJkICkKPj4+PiArICAgICAgICAgICAgcmV0ID0g
LUVJTlZBTDsgIAo+Pj4gV2h5PyBUaGVyZSdzIGUuZy4gbm8gZG9tYWluX3BhdXNlKCkgaW52b2x2
ZWQgaGVyZS4KPj4KPj4gSSBoYXZlIHRob3VnaHQgYWJvdXQgdGhhdC4gTm93IEkgdGhpbmsgdGhh
dCBwYXJ0IGNhbiBiZSBldmVuIHNpbXBsZXIsCj4+IGp1c3QgbGlrZSB0aGUgZm9sbG93aW5nIFhF
Tl9ET01DVExfc3VwcHJlc3Nfc3B1cmlvdXNfcGFnZV9mYXVsdHM6Cj4+IGp1c3QgY2hhbmdlIHRo
YXQgcmVhZC1vbmx5IHZhbHVlIHVuY29uZGl0aW9uYWxseS4gVGhlcmUgaXMgbm8gb2J2aW91cwo+
PiBoYXJtIGluIGNoYW5naW5nIHRoYXQgdmFsdWUuCj4+Cj4+PiBBbHNvIHRocm91Z2hvdXQgdGhl
IHBhdGNoIEkgd29uZGVyIGlmIGl0IHdhc24ndCBtb3JlIG5hdHVyYWwgdG8KPj4+IHB1dCB0aGUg
dW5pdCBsYXN0IGluIHRoZSBwYXJhbWV0ZXIgLyBmaWVsZCBuYW1lcy4KPj4KPj4gVGhhdCB3YXMg
anVzdCB0byBrZWVwIHRoZSBkaWZmIHNsaWdodGx5IHNtYWxsZXIuCj4gCj4gSSdtIG9ubHkgdGFs
a2luZyBhYm91dCBhZGRpdGlvbnMgeW91IG1ha2UsIGFuZCBJIGRvbid0IHNlZSBhIHNpemUKPiBk
aWZmZXJlbmNlIGJldHdlZW4gInZ0c2Nfa2h6X3RvbGVyYW5jZSIgYW5kICJ2dHNjX3RvbGVyYW5j
ZV9raHoiLgoKKzEgdG8gdW5pdCBhdCB0aGUgZW5kLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
