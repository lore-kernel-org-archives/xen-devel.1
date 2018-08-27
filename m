From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v2 0/2] x86/xen: avoid 32-bit writes to PTEs
 in PV PAE guests
Date: Mon, 27 Aug 2018 12:07:14 -0400
Message-ID: <CAKf6xpso+LuN2npRvD8qB=b4eX8=uVc+5-ynEC3iNXBZpG0WWA__22667.4247104258$1535385989$gmane$org@mail.gmail.com>
References: <20180821153755.30462-1-jgross@suse.com>
 <CAKf6xps=OoS_S22KAiRwBdUeJE8b=EruiLJpc95b28+Ku3246w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3kc6=lk=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1fuK36-0001r6-NC
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 16:07:28 +0000
Received: by mail-lj1-x241.google.com with SMTP id l15-v6so12840304lji.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 09:07:27 -0700 (PDT)
In-Reply-To: <CAKf6xps=OoS_S22KAiRwBdUeJE8b=EruiLJpc95b28+Ku3246w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, open list <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMTI6MDMgUE0gSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDIxLCAyMDE4IGF0IDExOjQwIEFNIEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hpbGUgdGhlIGh5
cGVydmlzb3IgZW11bGF0ZXMgcGxhaW4gd3JpdGVzIHRvIFBURXMgaGFwcGlseSwgdGhpcyBpcwo+
ID4gbXVjaCBzbG93ZXIgdGhhbiBpc3N1aW5nIGEgaHlwZXJjYWxsIGZvciBQVEUgbW9kaWZjYXRp
b25zLiBBbmQgd3JpdGluZwo+ID4gYSBQVEUgdmlhIHR3byAzMi1iaXQgd3JpdGUgaW5zdHJ1Y3Rp
b25zIChlc3BlY2lhbGx5IHdoZW4gY2xlYXJpbmcgdGhlCj4gPiBQVEUpIHdpbGwgcmVzdWx0IGlu
IGFuIGludGVybWVkaWF0ZSBMMVRGIHZ1bG5lcmFibGUgUFRFLgo+ID4KPiA+IFdyaXRlcyB0byBQ
QUUgUFRFcyBzaG91bGQgYWx3YXlzIGJlIGRvbmUgd2l0aCA2NC1iaXQgd3JpdGVzIG9yIHZpYQo+
ID4gaHlwZXJjYWxscy4KPiA+Cj4gPiBKdWVyZ2VuIEdyb3NzICgyKToKPiA+ICAgeDg2L3hlbjog
ZG9uJ3Qgd3JpdGUgcHRlcyBkaXJlY3RseSBpbiAzMi1iaXQgUFYgZ3Vlc3RzCj4gPiAgIHg4Ni9w
YWU6IHVzZSA2NCBiaXQgYXRvbWljIHhjaGcgZnVuY3Rpb24gaW4gbmF0aXZlX3B0ZXBfZ2V0X2Fu
ZF9jbGVhcgo+ID4KPgo+IEkgdGVzdGVkIGJvdGggcGF0Y2hlcyBvbiA0LjE0LCBjaGFuZ2luZyBw
YXRjaCAyIHRvIGF0b21pYzY0X3hjaGcgc2luY2UKPiBhcmNoX2F0b21pYzY0X3hjaGcgZG9lc24n
dCBleGlzdC4KPgo+IEkgaGF2ZW4ndCBzZWVuIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTk4NDk3Cj4gdHJpZ2dlciBzaW5jZSBpbmNvcnBvcmF0aW5nIHRoZXNl
IHBhdGNoLiBXaXRob3V0IHRoZSBwYXRjaGVzLCBJIHdvdWxkCj4gaGF2ZSBzZWVuIGl0IHRyaWdn
ZXIgYnkgbm93LiAgQWxzbywgSSd2ZSBjb25maXJtZWQgWGVuIGRvZXMgbm90IGVuYWJsZQo+IHBh
Z2UgdGFibGUgc2hhZG93aW5nLiAgRm9yIHdoYXQgaXQncyB3b3J0aCwgdGhlIFBURXMgdGhhdCB3
b3VsZAo+IHRyaWdnZXIgWGVuIHNoYWRvd2luZyAoMHg4MDAwJzAwMDInMDAwMCcwMDAwKSBhcmUg
dGhlIHNhbWUgYXMgdGhvc2UKPiB0aGF0IHRyaWdnZXJlZCBidWcgMTk4NDk3LiAgVGhlcmUgd2Fz
IGF0IGxlYXN0IDEgbm9uLVhlbiB1c2VyIGFmZmVjdGVkCj4gYnkgMTk4NDk3LCBidXQgdGhpcyBh
dCBsZWFzdCBzZWVtcyB0byBmaXggaXQgZm9yIG1lLgo+Cj4gVGVzdGVkLWJ5OiBKYXNvbiBBbmRy
eXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+CgpBbHNvLCBjYW4gdGhlc2UgcGF0Y2hlcyBiZSBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZz8KClRoYW5rcywKSmFzb24KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
