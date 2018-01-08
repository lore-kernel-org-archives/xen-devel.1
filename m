From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 00/22] Vixen: A PV-in-HVM shim
Date: Mon, 8 Jan 2018 17:34:08 +0000
Message-ID: <20180108173408.vdkn6j7rq5jutbii@citrix.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <20180108115457.u4rspcpesep4we46@citrix.com>
 <20180108121155.vswrajzxi6wri3gd@MacBook-Pro-de-Roger.local>
 <CA+aC4kv-w9h4HHX-Y9_fTJFMDuF+VZuEG0b5d_hX8a8KrJG9FQ@mail.gmail.com>
 <20180108163042.toflejze5yfyyh3p@citrix.com>
 <23123.40617.499020.136246@mariner.uk.xensource.com>
 <CA+aC4kta-6E5qvybERg15eYw4AN0Q1FTfiFje_dz0wWHX8SNWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9h6o=ed=citrix.com=prvs=53941dece=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYbJz-0008BV-Nx
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 17:34:51 +0000
Content-Disposition: inline
In-Reply-To: <CA+aC4kta-6E5qvybERg15eYw4AN0Q1FTfiFje_dz0wWHX8SNWw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2ESch=F6nherr?= <jschoenh@amazon.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Anthony Liguori <aliguori@amazon.com>, Matt Wilson <msw@amazon.com>, security@xen.org, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMDk6MDM6NDRBTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IE9uIE1vbiwgSmFuIDgsIDIwMTggYXQgODozOSBBTSwgSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+IHdyb3RlOgo+ID4gV2VpIExpdSB3cml0ZXMgKCJSZTog
W1hlbi1kZXZlbF0gW1BBVENIIDAwLzIyXSBWaXhlbjogQSBQVi1pbi1IVk0gc2hpbSIpOgo+ID4+
IE9uIE1vbiwgSmFuIDA4LCAyMDE4IGF0IDA4OjAyOjA3QU0gLTA4MDAsIEFudGhvbnkgTGlndW9y
aSB3cm90ZToKPiA+PiA+IE9UT0gsIHRoZSBIVk0gdmVyc2lvbiBvZiB0aGUgc2VyaWVzIHJlcXVp
cmVzIG5vIHRvb2xzIGNoYW5nZXMgYW5kCj4gPj4gPiB3b3JrcyBvbiBYZW4gdmVyc2lvbnMgZ29p
bmcgYmFjayB0byAzLjQgKGF0IGxlYXN0KS4KPiA+Cj4gPiBUaGF0IGRlcGVuZHMsIEkgdGhpbmss
IG9uIGhvdyB5b3UgYXJlIHNlbGVjdGluZyB0aGUgZ3Vlc3Qga2VybmVsLgo+ID4KPiA+IGxpYnhs
IChhdCBsZWFzdCwgb2xkZXIgbGlieGxzKSBkb24ndCBzdXBwb3J0IGRpcmVjdCBrZXJuZWwgYm9v
dCBpbiBIVk0KPiA+IG1vZGUuICBTbyBpZiB5b3Ugd2VyZSB1c2luZyBrZXJuZWw9IGluIHlvdXIg
Y29uZmlnIGZpbGUgdGhhdCB3b24ndAo+ID4gd29yayB3aXRob3V0IGxpYnhsIGNoYW5nZXMgd2hp
Y2ggYXJlIHJlYWxseSBoYXJkIHRvIGRvIGFuZCBhbHNvCj4gPiBtYWludGFpbiBBQkkgY29tcGF0
aWJpbGl0eS4KPiA+Cj4gPiBMaWtld2lzZSBib290bG9hZGVyPSAoZWcgYm9vdGxvYWRlcj0icHln
cnViIikuCj4gCj4gSSB0aGluayBwdmdydWIgaXMgYSBwcmV0dHkgcmVhc29uYWJsZSBhbHRlcm5h
dGl2ZSB0byBweWdydWIgZm9yIG1vc3QgcGVvcGxlLgo+IAo+IFdoYXQgd2Ugc3BlY2lmaWNhbGx5
IGRpZCB3YXMgdGFrZSB0aGUga2VybmVsL2V0YyBhcmd1bWVudHMgYW5kIHVzZWQgdGhlbQo+IHRv
IGdlbmVyYXRlIGFuIElTTyB3aXRoIGlzb2xpbnV4IHdpdGggdGhlIHNoaW0gZW1iZWRkZWQgaW4g
dGhlIElTTy4KPiAKPiBXaGlsZSBpdCBkb2VzIHdvcmsgdG8gc2V0IGJvb3Q9ImQiIGFuZCBhZGQg
dGhlIElTTyB0byB0aGUgZGlzaz1bXSBvcHRpb24sIHdlCj4gcHJlZmVycmVkIHRvIHVzZSBhIHdy
YXBwZXIgYXJvdW5kIHFlbXUgdG8gZGlyZWN0bHkgYWRkIGEgLWNkcm9tIG9wdGlvbiBzbwo+IHRo
YXQgdGhlIElTTyB3b3VsZCBub3QgYmUgZXhwb3NlZCBhcyBhIGJsa2JhY2sgZGV2aWNlLgo+IAoK
SWYgeW91IHVzZSBhbiBJU08gd2hpY2ggYm9vdHMgaXNvbGludXgsIHdoZW4gYW5kIHdoZXJlIGRv
IHlvdSBnZXQKaHZtX3N0YXJ0X2luZm8/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
