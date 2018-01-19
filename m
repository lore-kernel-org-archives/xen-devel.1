From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCHv2] xen: Add EFI_LOAD_OPTION support
Date: Fri, 19 Jan 2018 09:46:30 -0700
Message-ID: <CABfawh=9Zsg=v5w+CpRfeOm7rcWF=w9iH6xmFaEVBZMSeG29aQ@mail.gmail.com>
References: <20180104203305.18447-1-tamas@tklengyel.com>
 <5A60E23302000078001A009F@prv-mh.provo.novell.com>
 <5A61C4A702000078001A03B8@prv-mh.provo.novell.com>
 <CABfawhmRwCojV6WV99gSmnhcp4T+gYwz2D9-QSOH6US1Vz5Zwg@mail.gmail.com>
 <5A622DB602000078001A085E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gpqk=eo=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ecZoz-0002R2-VV
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 16:47:18 +0000
Received: by mail-wm0-f68.google.com with SMTP id 143so4594072wma.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2018 08:47:12 -0800 (PST)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com.
 [209.85.128.179])
 by smtp.gmail.com with ESMTPSA id l60sm4028389edl.83.2018.01.19.08.47.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jan 2018 08:47:11 -0800 (PST)
Received: by mail-wr0-f179.google.com with SMTP id f11so2128605wre.4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2018 08:47:11 -0800 (PST)
In-Reply-To: <5A622DB602000078001A085E@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, openxt <openxt@googlegroups.com>, Tamas K Lengyel <lengyelt@ainfosec.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgOTo0MSBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPj4+PiBPbiAxOS4wMS4xOCBhdCAxNzoyNSwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+IHdyb3RlOgo+PiBPbiBGcmksIEphbiAxOSwgMjAxOCBhdCAyOjEyIEFNLCBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQW5kIHRoZW4gLSBob3cgYWJvdXQg
YSBkaWZmZXJlbnQgaGV1cmlzdGljIGFsdG9nZXRoZXI6IEN1cnJlbnQKPj4+IGNvZGUgc2NhbnMg
dGhlIHBvaW50ZWQgdG8gbWVtb3J5IGZvciBhIG51bCBjaGFyYWN0ZXIsIGJlaW5nCj4+PiBoYXBw
eSBpZiBpdCBpcyBmb3VuZCBiZWZvcmUgaGF2aW5nIGV4aGF1c3RlZCBjbWRzaXplLgo+Pgo+PiBJ
J20gbm90IHN1cmUgd2hhdCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQuIFRoZSBudWwgY2hhciBpcyBu
b3QgYXQgdGhlCj4+IGVuZCBvZiB0aGUgRUZJX0xPQURfT1BUSU9OLCBpdCBpcyBvbmx5IGF0IHRo
ZSBlbmQgb2YgdGhlIERlc2NyaXB0aW9uCj4+IGFycmF5LiBBbmQgd2UgaGF2ZSB0byBzY2FuIGZv
ciBpdCBiZWNhdXNlIHRoZSBsZW5ndGggb2YgdGhlCj4+IERlc2NyaXB0aW9uIGFycmF5IGlzIG5v
dCByZWNvcmRlZCBhbnl3aGVyZSBlbHNlLiBTbyB3ZSBzY2FuIGZvciB0aGUKPj4gbnVsIGNoYXIg
aW4gdGhlIHBhcnQgb2YgdGhlIGJ1ZmZlciB3aGVyZSBpdCB3b3VsZCBiZSB3YXJyYW50ZWQgYnkg
dGhlCj4+IEVGSSBzcGVjLCB0aGVuIGNvbXB1dGUgdGhlIGxvY2F0aW9uIG9mIHRoZSBhY3R1YWwg
b3B0aW9uIGJ1ZmZlciBiYXNlZAo+PiBvbiB0aGF0IGNoZWNraW5nIHRoYXQgaXQgaXMgd2l0aGlu
IGJvdW5kcyBvZiB0aGUgYnVmZmVyLgo+Cj4gQnkgImN1cnJlbnQgY29kZSIgSSBtZWFuIHdoYXQn
cyB1cHN0cmVhbSBhdCBwcmVzZW50LCBub3QgeW91cnMuCj4gSS5lLiBJJ20gc3VnZ2VzdGluZyB0
byBjb25zaWRlciBwcm92aW5nIGl0J3MgYSBudWwtdGVybWluYXRlZCBzdHJpbmcKPiBpbnN0ZWFk
IG9mIHByb3ZpbmcgaXRzIGFuIEVGSV9MT0FEX09QVElPTiBzdHJ1Y3R1cmUuCj4KCkFoLCB5ZXMs
IHRoYXQgbWFrZXMgbW9yZSBzZW5zZS4gRm9yIHRoZSBFRklfTE9BRF9PUFRJT04gY2FzZSB3ZSB3
b3VsZApzdGlsbCBoYXZlIHRvIGRvIGFsbCB0aGUgcGFyc2luZyBhbmQgc2FuaXR5IGNoZWNraW5n
IHdlIGN1cnJlbnRseSBkbwp0aG91Z2guIEJ1dCBhZGRpbmcgYSBjaGVjayB0byBzZWUgd2hldGhl
ciB0aGUgYnVmZmVyIGVuZHMgaW4gYSBudWwgYW5kCmlmIGl0IGRvZXMgc2tpcHBpbmcgdGhlIEVG
SV9MT0FEX09QVElPTiBwYXJzaW5nIHdvdWxkIGJlIGZpbmUuCgpUYW1hcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
