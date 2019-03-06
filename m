From: Juergen Gross <jgross@suse.com>
Subject: Re: L1TF Patch Series v8
Date: Wed, 6 Mar 2019 17:04:02 +0100
Message-ID: <da1dd747-1ee3-6ec3-b488-2de1600a1e04@suse.com>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
 <5C7FEA73020000780021C2EE@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7dmf=RJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1Z1b-0000ib-1f
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 16:04:07 +0000
In-Reply-To: <5C7FEA73020000780021C2EE@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDMvMjAxOSAxNjo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMDIuMTkg
YXQgMTc6MTMsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBUaGlzIHBhdGNoIHNlcmll
cyBhdHRlbXB0cyB0byBtaXRpZ2F0ZSB0aGUgaXNzdWUgdGhhdCBoYXZlIGJlZW4gcmFpc2VkIGlu
IHRoZQo+PiBYU0EtMjg5IChodHRwczovL3hlbmJpdHMueGVuLm9yZy94c2EvYWR2aXNvcnktMjg5
Lmh0bWwpLiBUbyBibG9jayBzcGVjdWxhdGl2ZQo+PiBleGVjdXRpb24gb24gSW50ZWwgaGFyZHdh
cmUsIGFuIGxmZW5jZSBpbnN0cnVjdGlvbiBpcyByZXF1aXJlZCB0byBtYWtlIHN1cmUKPj4gdGhh
dCBzZWxlY3RlZCBjaGVja3MgYXJlIG5vdCBieXBhc3NlZC4gU3BlY3VsYXRpdmUgb3V0LW9mLWJv
dW5kIGFjY2Vzc2VzIGNhbgo+PiBiZSBwcmV2ZW50ZWQgYnkgdXNpbmcgdGhlIGFycmF5X2luZGV4
X25vc3BlYyBtYWNyby4KPj4KPj4gVGhlIG1ham9yIGNoYW5nZSBjb21wYXJlZCB0byB2ZXJzaW9u
IDggaXMgaW4gZ3JhbnRfdGFibGUgaGFuZGxpbmcsIHByb3RlY3RpbmcKPj4gYSBmZXcgbW9yZSB2
ZXJzaW9uIGNvbXBhcmlzb25zLgo+IAo+IEFwYXJ0IGZyb20gdGhhdCBsYXN0IHBhdGNoIHRoaXMg
c2VyaWVzIGxvb2tzIHRvIGhhdmUgYmVlbiByZWFkeSB0byBnbyBpbgo+IGZvciBhYm91dCBhIHdl
ZWsuIFdvdWxkIHlvdSBzdGlsbCB3YW50IHRvIGFsbG93IGl0IGluLCBvciByYXRoZXIgZGVmZXIg
aXQKPiB1bnRpbCBhZnRlciB0aGUgcmVsZWFzZT8KCkknZCBsaWtlIHRvIGRlZmVyIHRoZW0uCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
