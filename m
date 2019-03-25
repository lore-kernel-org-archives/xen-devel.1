From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Mon, 25 Mar 2019 09:43:20 -0400
Message-ID: <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6__6359.46152485616$1553521492$gmane$org@oracle.com>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome> <20190325130530.56603806@luca64>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Brs=R4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h8PtL-0005Ji-MY
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 13:43:55 +0000
In-Reply-To: <20190325130530.56603806@luca64>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: luca abeni <luca.abeni@santannapisa.it>, Dario Faggioli <dfaggioli@suse.com>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, linux-kernel@vger.kernel.org, thibodux@gmail.com, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMy8yNS8xOSA4OjA1IEFNLCBsdWNhIGFiZW5pIHdyb3RlOgo+IEhpIGFsbCwKPgo+IE9uIFNh
dCwgMjMgTWFyIDIwMTkgMTE6NDE6NTEgKzAxMDAKPiBsdWNhIGFiZW5pIDxsdWNhLmFiZW5pQHNh
bnRhbm5hcGlzYS5pdD4gd3JvdGU6Cj4gWy4uLl0KPj4+PiBJcyB0aGVyZSBhbnkgZGF0YSB0aGF0
IHNob3dzIGVmZmVjdHMgb2YgdXNpbmcgdGhpcyBuZXcgcGFyYW1ldGVyPwo+Pj4+ICAgICAKPj4+
IFllcywgSSd2ZSBkb25lIHNvbWUgcmVzZWFyY2ggYW5kIGV4cGVyaW1lbnRzIG9uIHRoaXMuIEkg
ZGlkIGl0Cj4+PiB0b2dldGhlciB3aXRoIGEgZnJpZW5kLCB3aGljaCBJJ20gQ2MtaW5nLCBhcyBJ
J20gbm90IHN1cmUgd2UncmUKPj4+IHJlYWR5L2NhcGFibGUgdG8gc2hhcmUgdGhlIHJlc3VsdHMs
IHlldCAoTHVjYT8pLiAgCj4+IEkgdGhpbmsgd2UgY2FuIGVhc2lseSBzaGFyZSB0aGUgZXhwZXJp
bWVudGFsIGRhdGEgKGN5Y2xpY3Rlc3Qgb3V0cHV0Cj4+IGFuZCBwbG90cykuCj4+Cj4+IE1vcmVv
dmVyLCB3ZSBjYW4gc2hhcmUgdGhlIHNjcmlwdHMgYW5kIHRvb2xzIGZvciBydW5uaW5nIHRoZQo+
PiBleHBlcmltZW50cyAoc28sIGV2ZXJ5b25lIGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRoZSBudW1i
ZXJzIGJ5IHNpbXBseQo+PiB0eXBpbmcgIm1ha2UiIGFuZCB3YWl0aW5nIGZvciBzb21lIHRpbWUg
OikKPj4KPj4KPj4gSSdsbCB0cnkgdG8gcGFja2FnZSB0aGUgcmVzdWx0cyBhbmQgdGhlIHNjcmlw
dHMvdG9vbHMgdGhpcyBldmVuaW5nLAo+PiBhbmQgSSdsbCBzZW5kIHRoZW0uCj4gU29ycnkgZm9y
IHRoZSBkZWxheS4gSSBwdXQgc29tZSBxdWljayByZXN1bHRzIGhlcmU6Cj4gaHR0cDovL3JldGlz
LnNhbnRhbm5hcGlzYS5pdC9sdWNhL1hlblRpbWVycy8KPiAodGhlcmUgYWxzbyBpcyBhIGxpbmsg
dG8gdGhlIHNjcmlwdHMgdG8gYmUgdXNlZCBmb3IgcmVwcm9kdWNpbmcgdGhlCj4gcmVzdWx0cyku
IFRoZSBsYXRlbmNpZXMgaGF2ZSBiZWVuIG1lYXN1cmVkIGJ5IHJ1bm5pbmcgY3ljbGljdGVzdCBp
biB0aGUKPiBndWVzdCAoc2VlIHRoZSBzY3JpcHRzIGZvciBkZXRhaWxzKS4KPgo+IFRoZSBwaWN0
dXJlIHNob3dzIHRoZSBsYXRlbmNpZXMgbWVhc3VyZWQgd2l0aCBhbiB1bnBhdGNoZWQgZ3Vlc3Qg
a2VybmVsCj4gYW5kIHdpdGggYSBndWVzdCBrZXJuZWwgaGF2aW5nIFRJTUVSX1NMT1Agc2V0IHRv
IDEwMDAgKGFyYml0cmFyeSBzbWFsbAo+IHZhbHVlIDopLgo+IEFsbCB0aGUgZXhwZXJpbWVudHMg
aGF2ZSBiZWVuIHBlcmZvcm1lZCBib290aW5nIHRoZSBoeXBlcnZpc29yIHdpdGggYQo+IHNtYWxs
IHRpbWVyX3Nsb3AgKHRoZSBoeXBlcnZpc29yJ3Mgb25lKSB2YWx1ZS4gU28sIHRoZXkgc2hvdyB0
aGF0Cj4gZGVjcmVhc2luZyB0aGUgaHlwZXJ2aXNvcidzIHRpbWVyX3Nsb3AgaXMgbm90IGVub3Vn
aCB0byBtZWFzdXJlIGxvdwo+IGxhdGVuY2llcyB3aXRoIGN5Y2xpY3Rlc3QuCgoKCkkgaGF2ZSBh
IGNvdXBsZSBvZiBxdWVzdGlvbnM6CiogRG9lcyBpdCBtYWtlIHNlbnNlIHRvIG1ha2UgdGhpcyBh
IHR1bmFibGUgZm9yIG90aGVyIGNsb2NrZXZlbnQgZGV2aWNlcwphcyB3ZWxsPwoqIFRoaXMgcGF0
Y2ggYWRqdXN0cyBtaW4gdmFsdWUuIENvdWxkIG1heCB2YWx1ZSAoZXZlcikgbmVlZCBhIHNpbWls
YXIKYWRqdXN0bWVudD8KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
