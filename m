From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Wed, 24 Jan 2018 00:37:33 -0700
Message-ID: <5A6845CD02000078001A1C77@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@prv-mh.provo.novell.com>
 <1484b1c8-6140-323e-9933-e1120f1e2a0d@citrix.com>
 <d1ddec7e-6e00-bf38-f105-8e5522721cc4@citrix.com>
 <afd747ee-804a-1350-7823-e362562aea79@suse.com>
 <ec981907-eeb7-a697-adb7-3fffe5185d77@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=5p9l=et=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eeFcs-0004yP-KI
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 07:37:42 +0000
In-Reply-To: <ec981907-eeb7-a697-adb7-3fffe5185d77@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDE4OjMzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBXZWxsIGF0IHZlcnkgbGVhc3QgdGhlcmUgc2hvdWxkIGJlIHNvbWV0aGluZyBpbiB0aGUg
Ym9vdCBzY3Jvb2wgdGhhdAo+IHNheXMsICJFbmFibGluZyBYZW4gUGFnZXRhYmxlIHByb3RlY3Rp
b24gKFhQVEkpIGZvciBQViBndWVzdHMiIG9yCj4gc29tZXRoaW5nLiAgKFRoYXQgZ29lcyBmb3Ig
dGhlIGN1cnJlbnQgcm91bmQgb2YgWFBUSSBhcyB3ZWxsIHJlYWxseS4pCgpBbmQgaW5kZWVkIEkg
aGF2ZSB0aGlzIG9uIG15IGxpc3Qgb2YgZm9sbG93LXVwIHRoaW5ncywgYnV0IGRpZG4ndCBnZXQK
dG8gaXQgeWV0LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
