From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 00/22] Vixen: A PV-in-HVM shim
Date: Mon, 8 Jan 2018 09:47:05 -0800
Message-ID: <CA+aC4ks_UbazxxdVS03mDPAzzPrWquL4JQuYM7S=qtL3UBWHRA@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <20180108115457.u4rspcpesep4we46@citrix.com>
 <20180108121155.vswrajzxi6wri3gd@MacBook-Pro-de-Roger.local>
 <CA+aC4kv-w9h4HHX-Y9_fTJFMDuF+VZuEG0b5d_hX8a8KrJG9FQ@mail.gmail.com>
 <20180108163042.toflejze5yfyyh3p@citrix.com>
 <23123.40617.499020.136246@mariner.uk.xensource.com>
 <CA+aC4kta-6E5qvybERg15eYw4AN0Q1FTfiFje_dz0wWHX8SNWw@mail.gmail.com>
 <20180108173408.vdkn6j7rq5jutbii@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h9h4=ed=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYbVv-0000sB-3v
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 17:47:11 +0000
Received: by mail-lf0-x241.google.com with SMTP id h5so12988686lfj.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2018 09:47:07 -0800 (PST)
In-Reply-To: <20180108173408.vdkn6j7rq5jutbii@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Jan Beulich <JBeulich@suse.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2ESch=C3=B6nherr?= <jschoenh@amazon.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Anthony Liguori <aliguori@amazon.com>, Matt Wilson <msw@amazon.com>, security@xen.org, xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gOCwgMjAxOCBhdCA5OjM0IEFNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPiBPbiBNb24sIEphbiAwOCwgMjAxOCBhdCAwOTowMzo0NEFNIC0wODAwLCBB
bnRob255IExpZ3Vvcmkgd3JvdGU6Cj4+IE9uIE1vbiwgSmFuIDgsIDIwMTggYXQgODozOSBBTSwg
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+IHdyb3RlOgo+PiA+IFdlaSBM
aXUgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAwMC8yMl0gVml4ZW46IEEgUFYtaW4t
SFZNIHNoaW0iKToKPj4gPj4gT24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMDg6MDI6MDdBTSAtMDgw
MCwgQW50aG9ueSBMaWd1b3JpIHdyb3RlOgo+PiA+PiA+IE9UT0gsIHRoZSBIVk0gdmVyc2lvbiBv
ZiB0aGUgc2VyaWVzIHJlcXVpcmVzIG5vIHRvb2xzIGNoYW5nZXMgYW5kCj4+ID4+ID4gd29ya3Mg
b24gWGVuIHZlcnNpb25zIGdvaW5nIGJhY2sgdG8gMy40IChhdCBsZWFzdCkuCj4+ID4KPj4gPiBU
aGF0IGRlcGVuZHMsIEkgdGhpbmssIG9uIGhvdyB5b3UgYXJlIHNlbGVjdGluZyB0aGUgZ3Vlc3Qg
a2VybmVsLgo+PiA+Cj4+ID4gbGlieGwgKGF0IGxlYXN0LCBvbGRlciBsaWJ4bHMpIGRvbid0IHN1
cHBvcnQgZGlyZWN0IGtlcm5lbCBib290IGluIEhWTQo+PiA+IG1vZGUuICBTbyBpZiB5b3Ugd2Vy
ZSB1c2luZyBrZXJuZWw9IGluIHlvdXIgY29uZmlnIGZpbGUgdGhhdCB3b24ndAo+PiA+IHdvcmsg
d2l0aG91dCBsaWJ4bCBjaGFuZ2VzIHdoaWNoIGFyZSByZWFsbHkgaGFyZCB0byBkbyBhbmQgYWxz
bwo+PiA+IG1haW50YWluIEFCSSBjb21wYXRpYmlsaXR5Lgo+PiA+Cj4+ID4gTGlrZXdpc2UgYm9v
dGxvYWRlcj0gKGVnIGJvb3Rsb2FkZXI9InB5Z3J1YiIpLgo+Pgo+PiBJIHRoaW5rIHB2Z3J1YiBp
cyBhIHByZXR0eSByZWFzb25hYmxlIGFsdGVybmF0aXZlIHRvIHB5Z3J1YiBmb3IgbW9zdCBwZW9w
bGUuCj4+Cj4+IFdoYXQgd2Ugc3BlY2lmaWNhbGx5IGRpZCB3YXMgdGFrZSB0aGUga2VybmVsL2V0
YyBhcmd1bWVudHMgYW5kIHVzZWQgdGhlbQo+PiB0byBnZW5lcmF0ZSBhbiBJU08gd2l0aCBpc29s
aW51eCB3aXRoIHRoZSBzaGltIGVtYmVkZGVkIGluIHRoZSBJU08uCj4+Cj4+IFdoaWxlIGl0IGRv
ZXMgd29yayB0byBzZXQgYm9vdD0iZCIgYW5kIGFkZCB0aGUgSVNPIHRvIHRoZSBkaXNrPVtdIG9w
dGlvbiwgd2UKPj4gcHJlZmVycmVkIHRvIHVzZSBhIHdyYXBwZXIgYXJvdW5kIHFlbXUgdG8gZGly
ZWN0bHkgYWRkIGEgLWNkcm9tIG9wdGlvbiBzbwo+PiB0aGF0IHRoZSBJU08gd291bGQgbm90IGJl
IGV4cG9zZWQgYXMgYSBibGtiYWNrIGRldmljZS4KPj4KPgo+IElmIHlvdSB1c2UgYW4gSVNPIHdo
aWNoIGJvb3RzIGlzb2xpbnV4LCB3aGVuIGFuZCB3aGVyZSBkbyB5b3UgZ2V0Cj4gaHZtX3N0YXJ0
X2luZm8/Cgpodm1sb2FkZXIgaXMgc3RpbGwgdXNlZC4gICBUaGUgZnVsbCBIVk0gYm9vdCBzdGFj
ayBpcyBpbnRhY3Qgc28gaXQncwpodm1sb2FkZXIgLT4ge3BjYmlvcyxzZWFiaW9zfSAtPiBib290
IGxvYWRlci4KCkZvciB0ZXN0aW5nLCBJJ3ZlIGJlZW4gdXNpbmcgZ3J1YiBhcyB0aGUgYm9vdCBs
b2FkZXIgYnV0IGlzb2xpbnV4CndvcmtzIGZpbmUgdG9vLgoKVGhlIHNoaW0gaXMgYm9vdGVkIGFz
IGEgbXVsdGlib290IGtlcm5lbCBhbmQgdGhlIG9yaWdpbmFsCmtlcm5lbC9pbml0cmQgYXJlIHBh
c3NlZCBhcyBtdWx0aWJvb3QgbW9kdWxlcy4KClJlZ2FyZHMsCgpBbnRob255IExpZ3VvcmkKCj4g
V2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
