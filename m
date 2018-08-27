From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v2 0/2] x86/xen: avoid 32-bit writes to PTEs
 in PV PAE guests
Date: Mon, 27 Aug 2018 12:03:25 -0400
Message-ID: <CAKf6xps=OoS_S22KAiRwBdUeJE8b=EruiLJpc95b28+Ku3246w__14231.0714385987$1535385741$gmane$org@mail.gmail.com>
References: <20180821153755.30462-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3kc6=lk=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1fuJzP-0001f0-JN
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 16:03:39 +0000
Received: by mail-lj1-x243.google.com with SMTP id y17-v6so12816023ljy.8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 09:03:38 -0700 (PDT)
In-Reply-To: <20180821153755.30462-1-jgross@suse.com>
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

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMTE6NDAgQU0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPgo+IFdoaWxlIHRoZSBoeXBlcnZpc29yIGVtdWxhdGVzIHBsYWluIHdy
aXRlcyB0byBQVEVzIGhhcHBpbHksIHRoaXMgaXMKPiBtdWNoIHNsb3dlciB0aGFuIGlzc3Vpbmcg
YSBoeXBlcmNhbGwgZm9yIFBURSBtb2RpZmNhdGlvbnMuIEFuZCB3cml0aW5nCj4gYSBQVEUgdmlh
IHR3byAzMi1iaXQgd3JpdGUgaW5zdHJ1Y3Rpb25zIChlc3BlY2lhbGx5IHdoZW4gY2xlYXJpbmcg
dGhlCj4gUFRFKSB3aWxsIHJlc3VsdCBpbiBhbiBpbnRlcm1lZGlhdGUgTDFURiB2dWxuZXJhYmxl
IFBURS4KPgo+IFdyaXRlcyB0byBQQUUgUFRFcyBzaG91bGQgYWx3YXlzIGJlIGRvbmUgd2l0aCA2
NC1iaXQgd3JpdGVzIG9yIHZpYQo+IGh5cGVyY2FsbHMuCj4KPiBKdWVyZ2VuIEdyb3NzICgyKToK
PiAgIHg4Ni94ZW46IGRvbid0IHdyaXRlIHB0ZXMgZGlyZWN0bHkgaW4gMzItYml0IFBWIGd1ZXN0
cwo+ICAgeDg2L3BhZTogdXNlIDY0IGJpdCBhdG9taWMgeGNoZyBmdW5jdGlvbiBpbiBuYXRpdmVf
cHRlcF9nZXRfYW5kX2NsZWFyCj4KCkkgdGVzdGVkIGJvdGggcGF0Y2hlcyBvbiA0LjE0LCBjaGFu
Z2luZyBwYXRjaCAyIHRvIGF0b21pYzY0X3hjaGcgc2luY2UKYXJjaF9hdG9taWM2NF94Y2hnIGRv
ZXNuJ3QgZXhpc3QuCgpJIGhhdmVuJ3Qgc2VlbiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcv
c2hvd19idWcuY2dpP2lkPTE5ODQ5Nwp0cmlnZ2VyIHNpbmNlIGluY29ycG9yYXRpbmcgdGhlc2Ug
cGF0Y2guIFdpdGhvdXQgdGhlIHBhdGNoZXMsIEkgd291bGQKaGF2ZSBzZWVuIGl0IHRyaWdnZXIg
Ynkgbm93LiAgQWxzbywgSSd2ZSBjb25maXJtZWQgWGVuIGRvZXMgbm90IGVuYWJsZQpwYWdlIHRh
YmxlIHNoYWRvd2luZy4gIEZvciB3aGF0IGl0J3Mgd29ydGgsIHRoZSBQVEVzIHRoYXQgd291bGQK
dHJpZ2dlciBYZW4gc2hhZG93aW5nICgweDgwMDAnMDAwMicwMDAwJzAwMDApIGFyZSB0aGUgc2Ft
ZSBhcyB0aG9zZQp0aGF0IHRyaWdnZXJlZCBidWcgMTk4NDk3LiAgVGhlcmUgd2FzIGF0IGxlYXN0
IDEgbm9uLVhlbiB1c2VyIGFmZmVjdGVkCmJ5IDE5ODQ5NywgYnV0IHRoaXMgYXQgbGVhc3Qgc2Vl
bXMgdG8gZml4IGl0IGZvciBtZS4KClRlc3RlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtA
Z21haWwuY29tPgoKVGhhbmsgeW91LgpKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
