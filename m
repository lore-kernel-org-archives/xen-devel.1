From: George Dunlap <dunlapg@umich.edu>
Subject: Re: Upping gcc requirement for x86
Date: Fri, 30 Mar 2018 09:51:34 +0100
Message-ID: <CAFLBxZZBssuZnmAYgsG3mJ6jGZqAtPOL-a1f7XgjSTKB7fPoFQ@mail.gmail.com>
References: <20180329154523.nvxkzn5rhetphwki@citrix.com>
 <CAFLBxZZJX1DPv-M8n_CDFf7OWfxmBwtXC9eDQb_WRXz9V5TYyA@mail.gmail.com>
 <0f8d92f1-9be1-88cb-6711-02e1099b069b@cardoe.com>
 <CAFLBxZYsHk2_soi7k-56medAyP_DyCyHxRhsFG4o0iuiGJmHEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x/b3=gu=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1f1pl1-000435-Uz
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 08:51:35 +0000
Received: by mail-qk0-x243.google.com with SMTP id o205so8570997qke.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Mar 2018 01:51:35 -0700 (PDT)
In-Reply-To: <CAFLBxZYsHk2_soi7k-56medAyP_DyCyHxRhsFG4o0iuiGJmHEg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMzAsIDIwMTggYXQgOTo1MCBBTSwgR2VvcmdlIER1bmxhcCA8ZHVubGFwZ0B1
bWljaC5lZHU+IHdyb3RlOgo+IE9uIFRodSwgTWFyIDI5LCAyMDE4IGF0IDY6NDcgUE0sIERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4gd3JvdGU6Cj4+IE9uIDMvMjkvMTggMTI6MDUg
UE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiBUaHUsIE1hciAyOSwgMjAxOCBhdCA0OjQ1
IFBNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+Cj4+PiBMb25nIHRl
cm0gSSB0aGluayB3ZSB3YW50IHRvIGdldCBhd2F5IGZyb20gYnVpbGRpbmcgc2VhYmlvcyBvdXJz
ZWx2ZXMKPj4+IGFsdG9nZXRoZXI7IGJ1dCBpdCdzIGEgYml0IGxhdGUgaW4gdGhlIHJlbGVhc2Ug
Y3ljbGUgdG8gd29yayBvdXQgdGhhdAo+Pj4ga2luZCBvZiBjaGFuZ2UuCj4+Pgo+Pj4gT24gdGhl
IHdob2xlIEknZCBwcm9iYWJseSBnbyB3aXRoICMzIGF0IHRoaXMgcG9pbnQuCj4+Pgo+Pj4gIC1H
ZW9yZ2UKPj4+Cj4+Cj4+IFZpb2xlbnQgYWdyZWVtZW50IGhlcmUuIEV2ZXJ5IGRpc3RybyB3YW50
cyB0byBzZWUgdGhpcyBzbyB0aGV5IGNhbiBzaGFyZQo+PiB0aGVzZSBibG9icy4gSXRzIHdoYXQg
bGVhZCB0byB0aGUgY2hhbmdlIHRvIHRyYWNraW5nIHRhZ3MgaW4KPj4gM2RkOTI2YTI1ZDg2NjM2
NGNlNmQ0NmMyMWY5YWMwNWE4MmZhN2ZmYiBvcmlnaW5hbGx5Lgo+Cj4gSSBkb24ndCB1bmRlcnN0
YW5kIHdoYXQgeW91IG1lYW4gLS0gQUZBSUsgdGhlcmUncyBubyAqZGVwZW5kZW5jeSogZnJvbQo+
IFhlbiB0byBhbnkgcGFydGljdWxhciB2ZXJzaW9uIG9mIFNlYUJJT1MgKHVubGlrZSBRRU1VKS4g
IElmIDEuOSB3b24ndAo+IGNvbXBpbGUgd2l0aCBnY2MgNC40LCBidXQgMS44IGRvZXMsIHdlIGNh
biBqdXN0IHBvaW50IHRoZSB0YWcgdG8gNC40LgoKU29ycnksIHRoaXMgc2hvdWxkIHNheSAid2Ug
Y2FuIGp1c3QgcG9pbnQgdGhlIFtTZWFCSU9TXSB0YWcgdG8gMS44LiIKCiAtRwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
