From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 02/12] x86: don't use hypervisor
 stack size for dumping guest stacks
Date: Tue, 23 Jan 2018 10:58:56 +0100
Message-ID: <8e536a60-76bb-0738-64ec-e3fad7f710f3@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-3-jgross@suse.com> <5A670DEF02000078001A16AF@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bxvh=es=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1edvMC-0002UX-8S
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 09:59:08 +0000
In-Reply-To: <5A670DEF02000078001A16AF@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMTggMTA6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjAxLjE4IGF0
IDEzOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gc2hvd19ndWVzdF9zdGFjaygpIGFu
ZCBjb21wYXRfc2hvd19ndWVzdF9zdGFjaygpIHN0b3AgZHVtcGluZyB0aGUKPj4gc3RhY2sgb2Yg
dGhlIGd1ZXN0IHdoZW5ldmVyIGl0cyB2aXJ0dWFsIGFkZHJlc3MgcmVhY2hlcyB0aGUgc2FtZQo+
PiBhbGlnbm1lbnQgd2hpY2ggaXMgdXNlZCBmb3IgdGhlIGh5cGVydmlzb3Igc3RhY2tzLgo+Pgo+
PiBSZW1vdmUgdGhpcyBhcmJpdHJhcnkgbGltaXQgYW5kIHRyeSB0byBkdW1wIGEgZml4ZWQgbnVt
YmVyIG9mIGxpbmVzCj4+IGluc3RlYWQuCj4gCj4gSG1tLCBJIGNhbiBzZWUgeW91ciBwb2ludCwg
YnV0IGJlZm9yZSBsb29raW5nIGF0IHRoZSBjaGFuZ2UgaW4gZGV0YWlsCj4gSSB0aGluayB3ZSBu
ZWVkIHRvIGFncmVlIG9uIHdoYXQgYmVoYXZpb3Igd2Ugd2FudC4gRHVtcGluZwo+IGFyYml0cmFy
eSBkYXRhIGFzIGlmIGl0IHdhcyBhIHBhcnQgb2YgdGhlIHN0YWNrIGlzbid0IHZlcnkgaGVscGZ1
bCwgbGltaXRpbmcKPiB0aGUgcmlzayBvZiB3aGljaCBpcywgSSB0aGluaywgdGhlIHJlYXNvbiBm
b3IgdGhlIHdheSB0aGluZ3MgY3VycmVudGx5Cj4gd29yayAoYXNzdW1pbmcgdGhhdCBndWVzdCBr
ZXJuZWxzIHdvbid0IGhhdmUgc3RhY2tzIGxhcmdlciB0aGFuIFhlbgo+IGl0c2VsZiwgYW5kIHRo
YXQgdGhleSB0b28gd291bGQgYWxpZ24gdGhlbSkuIFdoYXQgd291bGQgcGVyaGFwcyBiZQo+IGJl
dHRlciBpcyBmb3IgdGhlIGd1ZXN0IHRvIHN1cHBseSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcmVz
dHJpY3Rpb25zIGl0Cj4gZW5mb3JjZXMgb24gaXRzIHN0YWNrcywgd2hpY2ggWGVuIGNvdWxkIHRo
ZW4gdXNlIGhlcmUuIEluIHRoZQo+IGFic2VuY2Ugb2Ygc3VjaCBoaW50cyB1c2luZyB0aGUgdmFs
dWVzIGN1cnJlbnRseSBiZWluZyB1c2VkIHdvdWxkCj4gcG9zc2libHkgbWFrZSBzZW5zZS4KCkN1
cnJlbnRseSB0aGUgc3RhY2sgZHVtcCB3aWxsIGhhdmUgdGhlIHNhbWUgZml4ZWQgbnVtYmVyIG9m
IGxpbmVzIGFzCndpdGggbXkgcGF0Y2guIEknbSBvbmx5IHJlbW92aW5nIHRoZSBwcmVtYXR1cmUg
ZW5kIG9mIGR1bXBpbmcgd2hlbmV2ZXIKdGhlIHN0YWNrIGFkZHJlc3MgY3Jvc3NlcyBhIDMya0Ig
Ym91bmRhcnkuIExpbnV4IDY0IGJpdCBwdiBndWVzdHMgYXJlCnVzaW5nIDE2a0Igc3RhY2sgc2l6
ZS4gU28gdXNpbmcgdGhpcyBib3VuZGFyeSB3b3VsZCBiZSBtb3JlIG5hdHVyYWwuCgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
