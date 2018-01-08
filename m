From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 00/22] Vixen: A PV-in-HVM shim
Date: Mon, 8 Jan 2018 09:03:44 -0800
Message-ID: <CA+aC4kta-6E5qvybERg15eYw4AN0Q1FTfiFje_dz0wWHX8SNWw@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <20180108115457.u4rspcpesep4we46@citrix.com>
 <20180108121155.vswrajzxi6wri3gd@MacBook-Pro-de-Roger.local>
 <CA+aC4kv-w9h4HHX-Y9_fTJFMDuF+VZuEG0b5d_hX8a8KrJG9FQ@mail.gmail.com>
 <20180108163042.toflejze5yfyyh3p@citrix.com>
 <23123.40617.499020.136246@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h9h4=ed=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYapx-0005bV-AO
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 17:03:49 +0000
Received: by mail-lf0-x244.google.com with SMTP id w23so2671114lfd.11
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2018 09:03:47 -0800 (PST)
In-Reply-To: <23123.40617.499020.136246@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2ESch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, Matt Wilson <msw@amazon.com>, security@xen.org, xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gOCwgMjAxOCBhdCA4OjM5IEFNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4gd3JvdGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0g
W1BBVENIIDAwLzIyXSBWaXhlbjogQSBQVi1pbi1IVk0gc2hpbSIpOgo+PiBPbiBNb24sIEphbiAw
OCwgMjAxOCBhdCAwODowMjowN0FNIC0wODAwLCBBbnRob255IExpZ3Vvcmkgd3JvdGU6Cj4+ID4g
T1RPSCwgdGhlIEhWTSB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgcmVxdWlyZXMgbm8gdG9vbHMgY2hh
bmdlcyBhbmQKPj4gPiB3b3JrcyBvbiBYZW4gdmVyc2lvbnMgZ29pbmcgYmFjayB0byAzLjQgKGF0
IGxlYXN0KS4KPgo+IFRoYXQgZGVwZW5kcywgSSB0aGluaywgb24gaG93IHlvdSBhcmUgc2VsZWN0
aW5nIHRoZSBndWVzdCBrZXJuZWwuCj4KPiBsaWJ4bCAoYXQgbGVhc3QsIG9sZGVyIGxpYnhscykg
ZG9uJ3Qgc3VwcG9ydCBkaXJlY3Qga2VybmVsIGJvb3QgaW4gSFZNCj4gbW9kZS4gIFNvIGlmIHlv
dSB3ZXJlIHVzaW5nIGtlcm5lbD0gaW4geW91ciBjb25maWcgZmlsZSB0aGF0IHdvbid0Cj4gd29y
ayB3aXRob3V0IGxpYnhsIGNoYW5nZXMgd2hpY2ggYXJlIHJlYWxseSBoYXJkIHRvIGRvIGFuZCBh
bHNvCj4gbWFpbnRhaW4gQUJJIGNvbXBhdGliaWxpdHkuCj4KPiBMaWtld2lzZSBib290bG9hZGVy
PSAoZWcgYm9vdGxvYWRlcj0icHlncnViIikuCgpJIHRoaW5rIHB2Z3J1YiBpcyBhIHByZXR0eSBy
ZWFzb25hYmxlIGFsdGVybmF0aXZlIHRvIHB5Z3J1YiBmb3IgbW9zdCBwZW9wbGUuCgpXaGF0IHdl
IHNwZWNpZmljYWxseSBkaWQgd2FzIHRha2UgdGhlIGtlcm5lbC9ldGMgYXJndW1lbnRzIGFuZCB1
c2VkIHRoZW0KdG8gZ2VuZXJhdGUgYW4gSVNPIHdpdGggaXNvbGludXggd2l0aCB0aGUgc2hpbSBl
bWJlZGRlZCBpbiB0aGUgSVNPLgoKV2hpbGUgaXQgZG9lcyB3b3JrIHRvIHNldCBib290PSJkIiBh
bmQgYWRkIHRoZSBJU08gdG8gdGhlIGRpc2s9W10gb3B0aW9uLCB3ZQpwcmVmZXJyZWQgdG8gdXNl
IGEgd3JhcHBlciBhcm91bmQgcWVtdSB0byBkaXJlY3RseSBhZGQgYSAtY2Ryb20gb3B0aW9uIHNv
CnRoYXQgdGhlIElTTyB3b3VsZCBub3QgYmUgZXhwb3NlZCBhcyBhIGJsa2JhY2sgZGV2aWNlLgoK
SXQncyBub3QgZWZmb3J0IGZyZWUsIGJ1dCBpdCdzIGFsc28gYSBjaGFuZ2UgdGhhdCBJIHdvdWxk
IHRoaW5rIG1vc3QKYWRtaW5pc3RyYXRvcnMKY2FuIG1ha2UuCgpSZWdhcmRzLAoKQW50aG9ueSBM
aWd1b3JpCgo+PiA+IElmIGl0IHdhcyBlbnRpcmVseSBteSBjYWxsLCBJIHdvdWxkIHdvcmsgb24g
bWVyZ2luZyBIVk0gc2hpbQo+PiA+IGZpcnN0LCBnZXQgYSA0LjEwIHN0YWJsZSByZWxlYXNlIGN1
dCB3aXRoIGl0LCBhbmQgdGhlbiBmb2N1cyBvbgo+PiA+IGdldHRpbmcgUFZIIHNoaW0gaW4gcGxh
Y2UgZm9yIHRoZSA0LjExIHJlbGVhc2UuICBJIHRoaW5rIHRoaXMgaXMKPj4gPiB0aGUgcmlnaHQg
YmFsYW5jZSBvZiBhZGRyZXNzaW5nIHRoZSBzaG9ydCB0ZXJtIG5lZWRzIHdoaWxlIGFsc28KPj4g
PiBoYXZpbmcgdGhlIGJlc3QgbG9uZyB0ZXJtIHNvbHV0aW9uLgo+Pgo+PiBOb3QgbXkgY2FsbCBl
aXRoZXIuIEkgd2lsbCB3YWl0IGZvciBzZWN1cml0eSB0ZWFtIG1lbWJlciBhbmQgc3RhYmxlIHRy
ZWUKPj4gbWFpbnRhaW5lcnMgdG8gd2VpZ2h0IGluLgo+Cj4gU2luY2Ugc2hpbSB1c2VycyBhcmUg
Z29pbmcgdG8gYmUgdXNpbmcgdW5zdGFibGUvNC4xMCBhcyB0aGUgc2hpbQo+IGFueXdheSwgSSB0
aGluayBhIGdvb2QgcHJpb3JpdHkgaXMgaW5kZWVkIGdldHRpbmcgYSBnb29kIHNvbHV0aW9uIGZv
cgo+IDQuMTAuCj4KPiBQZXJzb25hbGx5IEkgYW0gbm90IGRvaW5nIGFueSBYZW4gcmV2aWV3IHdv
cmsgb3IgY29tbWl0IHdvcmsgcmlnaHQgbm93Cj4gdGhhdCBpcyBub3QgcmVsYXRlZCB0byBNZWx0
ZG93bi9TcGVjdHJlLiAgRXZlcnl0aGluZyBlbHNlIGhhcyB0byB3YWl0Lgo+Cj4gRnVydGhlcm1v
cmUgSSB0aGluayB3ZSBzaG91bGQgYXZvaWQgY29tbWl0dGluZyBhbnl0aGluZyB0bwo+IHhlbi11
bnN0YWJsZSB0aGF0IHdpbGwgY29tcGxpY2F0ZSBvdXIgZWZmb3J0cyBvbiB0aGUgc2hpbS4KPgo+
IElhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
