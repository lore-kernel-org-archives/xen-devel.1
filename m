From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: XSM in osstest, grub config, outstanding patch
Date: Fri, 1 Jun 2018 14:09:18 -0500
Message-ID: <b5791c79-92d6-6de3-f331-8a8d8caf924c@cardoe.com>
References: <23293.39695.999638.87854@mariner.uk.xensource.com>
 <234703d2-5cc1-3fff-ab7d-3eb2c9d28f84@cardoe.com>
 <23309.11085.571711.852107@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lvj4=it=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fOpQQ-0002ap-Ad
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 19:09:22 +0000
Received: by mail-yw0-x229.google.com with SMTP id r19-v6so5281592ywc.10
 for <xen-devel@lists.xenproject.org>; Fri, 01 Jun 2018 12:09:20 -0700 (PDT)
In-Reply-To: <23309.11085.571711.852107@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8yOS8xOCA1OjI4IEFNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBEb3VnIEdvbGRzdGVpbiB3
cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gWFNNIGluIG9zc3Rlc3QsIGdydWIgY29uZmlnLCBvdXRz
dGFuZGluZyBwYXRjaCIpOgo+PiBTbyBJIGJlbGlldmUgdGhlIHBhdGggZm9yd2FyZCBoZXJlIHdh
cyB0aGF0IHdlJ2QgYmFrZSB0aGUgImRlZmF1bHQiIFhTTQo+PiBwb2xpY3kgaW50byBYZW4gYW5k
IHRoZSB1c2VyIGNvdWxkIHRoZW4gb3ZlcnJpZGUgaXQgYnkgc3VwcGx5aW5nIG9uZQo+PiB3aXRo
IHRoZSBjdXJyZW50IG5hbWUuCj4gCj4gQ2FuIHlvdSBleHBsYWluIHdoeSB0aGlzIGlzIGJldHRl
ciB0aGFuIHNoaXBwaW5nIHRoZSBkZWZhdWx0IHBvbGljeQo+IGZpbGUgc2VwYXJhdGVseSAodmlh
IHhlbidzIGRpc3QvaW5zdGFsbC9ib290LykgPwo+IAo+IFRoaXMgaXMgYSBnZW51aW5lIHF1ZXN0
aW9uIC0gSSdtIG5vdCBhcmd1aW5nIGZvciB0aGUgY3VycmVudCBhcHByb2FjaCwKPiBidXQgd2Ug
c2hvdWxkIGNvbnNpZGVyIHRoZSBtZXJpdHMuICBOb3JtYWxseSwgYXMgYSBydWxlIG9mIHRodW1i
LAo+IGJha2luZyBjb25maWd1cmF0aW9uIGludG8gdGhpbmdzIG1ha2VzIHBlb3BsZSdzIGxpdmVz
IGhhcmRlci4gIEluIHRoaXMKPiBjYXNlLCBmb3IgZXhhbXBsZSwgbWF5YmUgaXQgbWFrZXMgaXQg
aGFyZCB0byBmaW5kIHRoZSBkZWZhdWx0IHBvbGljeQo+IHRvIGV4YW1pbmUgaXQsIG9yIGhhcmRl
ciB0byBrbm93IHdoYXQgdG8gY2FsbCB0aGUgcmVwbGFjZW1lbnQuCj4gCj4gSWFuLgo+IAoKVG8g
bWUgaXQgc2VlbWVkIHNhbmUuIEl0IHNvbHZlcyB0aGUgcXVlc3Rpb24gb2Ygd2hlcmUgZG8gdXNl
ciBzdXBwbGllZApwb2xpY2llcyBnbyAodGhleSBnbyBpbnRvIHRoZSBjdXJyZW50IG5hbWUpLiBJ
dCBzb2x2ZXMgdGhlIGlzc3VlIHdpdGgKdXNlcnMgaGF2aW5nIHRvIGN1cnJlbnRseSBvdmVyd3Jp
dGUgYSBkaXN0cm8gcGFja2FnZSBwcm92aWRlZCBmaWxlICh0aGUKcG9saWN5IGlzbid0IG1hcmtl
ZCBhcyBhIGNvbmZpZyBmaWxlIGluIGFueSBkaXN0cm8gY3VycmVudGx5KS4gSXQgd291bGQKc29s
dmUgdGhlIHF1ZXN0aW9uIHlvdSBhc2tlZCBzaW5jZSB0aGUgZGVmYXVsdHMgd291bGQgYmUgYmFr
ZWQgaW4uIEluCmVmZmVjdCB3ZSBjb3VsZCBoYXZlIGEgYnVpbGQgb2YgWGVuIHRoYXQgc3VwcG9y
dHMgWFNNIHdpdGggYSBkZWZhdWx0CnBvbGljeSB0aGF0IG1pcnJvcnMgdGhlIGN1cnJlbnQgREFD
IHNldHVwIGFuZCBpdCBjb3VsZCBmdW5jdGlvbmFsbHkKYmVoYXZlIHRoZSBzYW1lLgoKVGhlIHBv
bGljeSBmaWxlIGlzbid0IHNvbWV0aGluZyB0aGF0IHVzZXJzIGNhbiBleGFtaW5lIHNpbmNlIGl0
cyBhCmNvbXBpbGVkIHRoaW5nLiBUaGF0IHdheSB0aGUgZGVmYXVsdCBwb2xpY3kgc2hpcHMgd2l0
aCB0aGUgWGVuIHRyZWUgYW5kCndlIGNvdWxkIGhhdmUgYSBzZXBhcmF0ZSByZXBvIHdpdGggc29t
ZSBvdGhlciBwb2xpY2llcy4gVGhhdCB3b3VsZCBtYWtlCml0IGVhc2llciBmb3IgdXNlcnMgdG8g
dW5kZXJzdGFuZCBob3cgdG8gY3JlYXRlIHRoZWlyIG93biBwb2xpY2llcy4KCkknbSBtb3JlIGp1
c3QgdGhyb3dpbmcgaWRlYXMgb3V0IHRoZXJlIHNvIEknZCBiZSBoYXBweSB0byBoZWFyIGJldHRl
cgpzdWdnZXN0aW9ucy4KLS0gCkRvdWcgR29sZHN0ZWluCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
