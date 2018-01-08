From: "=?UTF-8?Q?Jan_H._Sch=c3=b6nherr?=" <jschoenh@amazon.de>
Subject: Re: [PATCH 18/22] vixen: Introduce ECS_PROXY for event
 channel proxying
Date: Mon, 8 Jan 2018 11:04:46 +0100
Message-ID: <93ac54eb-d203-8e31-7594-fdf552d836f3@amazon.de>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-19-git-send-email-aliguori@amzn.com>
 <20180107084426.4adspnlbemfgr3rd@MacBook-Pro-de-Roger.local>
 <CA+aC4ku-q3x5dkwyhu+Twb-SrDVAx+uQ8sfbHdT0sQEOb-ut1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ktwm=ed=amazon.com=prvs=539dac3c7=jschoenh@srs-us1.protection.inumbo.net>)
 id 1eYUIh-0005EK-JL
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:05:03 +0000
In-Reply-To: <CA+aC4ku-q3x5dkwyhu+Twb-SrDVAx+uQ8sfbHdT0sQEOb-ut1w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDcvMjAxOCAwNDo0NiBQTSwgQW50aG9ueSBMaWd1b3JpIHdyb3RlOgo+IE9uIFN1biwg
SmFuIDcsIDIwMTggYXQgMTI6NDQgQU0sIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPiB3cm90ZToKPj4gT24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDI6NTQ6MzNQTSAtMDgw
MCwgQW50aG9ueSBMaWd1b3JpIHdyb3RlOgo+Pj4gRnJvbTogSmFuIEguIFNjaMO2bmhlcnIgPGpz
Y2hvZW5oQGFtYXpvbi5kZT4KPj4+Cj4+PiBQcmV2aW91c2x5LCB3ZSB3b3VsZCBrZWVwIHByb3hp
ZWQgZXZlbnQgY2hhbm5lbHMgYXMgRUNTX0lOVEVSRE9NQUlOCj4+PiBjaGFubmVsIGFyb3VuZC4g
VGhpcyB3b3JrcyBmb3IgbW9zdCB0aGluZ3MsIGJ1dCBoYXMgdGhlIHByb2JsZW0KPj4+IHRoYXQg
RVZUQ0hOT1Bfc3RhdHVzIGlzIGJyb2tlbiwgYW5kIHRoYXQgRVZUQ0hOT1BfY2xvc2UgZG9lcyBu
b3QKPj4+IG1hcmsgYW4gZXZlbnQgY2hhbm5lbCBhcyBmcmVlLgo+Pgo+PiBXaHkgbm90IHVzZSBF
Q1NfUkVTRVJWRUQgZm9yIGV2ZW50IGNoYW5uZWxzIHRoYXQgYXJlIGZvcndhcmRlZCB0byBMMD8K
Pj4KPj4gWW91IGNvdWxkIGVhc2lseSBzZWUgd2hldGhlciBhbiBldmVudCBjaGFubmVsIGlzIGZv
cndhcmRlZCBvciBub3QganVzdAo+PiBieSBjaGVja2luZyBpZiBpdCdzIEVDU19SRVNFUlZFRCwg
YW5kIHRoZW4gZGVjaWRlIHdoZXRoZXIgdG8gZm9yd2FyZAo+PiB0aGUgaHlwZXJjYWxsIHRvIEww
IG9yIGhhbmRsZSBpdCBpbiB2aXhlbi4KPiAKPiBKYW4/CgpJIGRpZG4ndCBnbyBmb3IgUkVTRVJW
RUQsIGJlY2F1c2Ugb2YgcG90ZW50aWFsIGNvbmZ1c2lvbiB3aXRoIG90aGVyIFJFU0VSVkVECnBv
cnRzLiBBRkFJSywgdGhlcmUncyBvbmx5IHBvcnQgMCB0aGF0J3MgcmVzZXJ2ZWQsIGN1cnJlbnRs
eS4gSWYgeW91IGRvbid0CndhbnQgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiAicmVzZXJ2ZWQiIGFu
ZCAicHJveGllZCIsIHlvdSdkIGhhdmUgdG8gZm9yd2FyZApvcGVyYXRpb25zIG9uIHBvcnQgMCBh
cyB3ZWxsLCBhbmQgdGhlbiByZWx5IG9uIHBvcnQgMCBiZWluZyByZXNlcnZlZCBpbiBMMAphcyB3
ZWxsLgoKVXNpbmcgYSBzZXBhcmF0ZSBFQ1NfUFJPWFkgc2VlbWVkIGNsZWFuZXIgdG8gbWUuIExl
c3MgY2hhbmNlIHRvIGdldCBpdCB3cm9uZwpvciBmb3IgaXQgdG8gYWNjaWRlbnRhbGx5IGdldCBi
cm9rZW4gYnkgYSBmdXR1cmUgY2hhbmdlLiA6KQoKUmVnYXJkcwpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
