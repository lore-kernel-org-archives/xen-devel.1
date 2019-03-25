From: luca abeni <luca.abeni@santannapisa.it>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Mon, 25 Mar 2019 15:07:03 +0100
Message-ID: <20190325150703.3774b92d__11161.3396484003$1553522891$gmane$org@luca64>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome>
 <20190325130530.56603806@luca64>
 <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j4SG=R4=santannapisa.it=luca.abeni@srs-us1.protection.inumbo.net>)
 id 1h8QFr-0007Qu-5U
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 14:07:11 +0000
In-Reply-To: <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, linux-kernel@vger.kernel.org, Dario Faggioli <dfaggioli@suse.com>, thibodux@gmail.com, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBNb24sIDI1IE1hciAyMDE5IDA5OjQzOjIwIC0wNDAwCkJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgpbLi4uXQo+ID4gaHR0cDovL3JldGlz
LnNhbnRhbm5hcGlzYS5pdC9sdWNhL1hlblRpbWVycy8KPiA+ICh0aGVyZSBhbHNvIGlzIGEgbGlu
ayB0byB0aGUgc2NyaXB0cyB0byBiZSB1c2VkIGZvciByZXByb2R1Y2luZyB0aGUKPiA+IHJlc3Vs
dHMpLiBUaGUgbGF0ZW5jaWVzIGhhdmUgYmVlbiBtZWFzdXJlZCBieSBydW5uaW5nIGN5Y2xpY3Rl
c3QgaW4KPiA+IHRoZSBndWVzdCAoc2VlIHRoZSBzY3JpcHRzIGZvciBkZXRhaWxzKS4KPiA+Cj4g
PiBUaGUgcGljdHVyZSBzaG93cyB0aGUgbGF0ZW5jaWVzIG1lYXN1cmVkIHdpdGggYW4gdW5wYXRj
aGVkIGd1ZXN0Cj4gPiBrZXJuZWwgYW5kIHdpdGggYSBndWVzdCBrZXJuZWwgaGF2aW5nIFRJTUVS
X1NMT1Agc2V0IHRvIDEwMDAKPiA+IChhcmJpdHJhcnkgc21hbGwgdmFsdWUgOikuCj4gPiBBbGwg
dGhlIGV4cGVyaW1lbnRzIGhhdmUgYmVlbiBwZXJmb3JtZWQgYm9vdGluZyB0aGUgaHlwZXJ2aXNv
ciB3aXRoCj4gPiBhIHNtYWxsIHRpbWVyX3Nsb3AgKHRoZSBoeXBlcnZpc29yJ3Mgb25lKSB2YWx1
ZS4gU28sIHRoZXkgc2hvdyB0aGF0Cj4gPiBkZWNyZWFzaW5nIHRoZSBoeXBlcnZpc29yJ3MgdGlt
ZXJfc2xvcCBpcyBub3QgZW5vdWdoIHRvIG1lYXN1cmUgbG93Cj4gPiBsYXRlbmNpZXMgd2l0aCBj
eWNsaWN0ZXN0LiAgCj4gCj4gCj4gCj4gSSBoYXZlIGEgY291cGxlIG9mIHF1ZXN0aW9uczoKPiAq
IERvZXMgaXQgbWFrZSBzZW5zZSB0byBtYWtlIHRoaXMgYSB0dW5hYmxlIGZvciBvdGhlciBjbG9j
a2V2ZW50Cj4gZGV2aWNlcyBhcyB3ZWxsPwo+ICogVGhpcyBwYXRjaCBhZGp1c3RzIG1pbiB2YWx1
ZS4gQ291bGQgbWF4IHZhbHVlIChldmVyKSBuZWVkIGEgc2ltaWxhcgo+IGFkanVzdG1lbnQ/CgpT
b3JyeSwgSSBkbyBub3Qga25vdyBtdWNoIGFib3V0IGNsb2NrZXZlbnQgZGV2aWNlcywgc28gSSBo
YXZlIG5vIGFuc3dlcnMKdG8gdGhlc2UgcXVlc3Rpb25zLi4uCgpXaGF0IEkgY2FuIHNheSBpcyB0
aGF0IHdoZW4gSSByZXBlYXRlZCB0aGUgY3ljbGljdGVzdCBleHBlcmltZW50cyBvbgpWTXMgdXNp
bmcgYSBkaWZmZXJlbnQgY2xvY2tldmVudCBkZXZpY2UgKGxhcGljKSBJIGRpZCBub3QgbWVhc3Vy
ZSBsYXJnZQpsYXRlbmNpZXMuClNvLCBJIGd1ZXNzIHRoZSAibGFwaWMiIGNsb2NrZXZlbnQgZGV2
aWNlIGFscmVhZHkgZGVmYXVsdHMgdG8gYSBzbWFsbGVyCm1pbiB2YWx1ZSAobm90IHN1cmUgYWJv
dXQgb3RoZXIgY2xvY2tldmVudCBkZXZpY2VzLCBJIGRvIG5vdCBrbm93IGhvdwp0byB0ZXN0IHRo
ZW0pLgoKCgoJCQkJTHVjYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
