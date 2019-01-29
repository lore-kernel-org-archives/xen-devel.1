From: Norbert Manthey <nmanthey@amazon.de>
Subject: SpectreV1+L1TF Patch Series v5
Date: Tue, 29 Jan 2019 15:43:08 +0100
Message-ID: <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TCeJ=QF=amazon.de=prvs=9250e2409=nmanthey@srs-us1.protection.inumbo.net>)
 id 1goUc0-0001cG-M9
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 14:43:40 +0000
In-Reply-To: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

RGVhciBhbGwsCgpUaGlzIHBhdGNoIHNlcmllcyBhdHRlbXB0cyB0byBtaXRpZ2F0ZSB0aGUgaXNz
dWUgdGhhdCBoYXZlIGJlZW4gcmFpc2VkIGluIHRoZQpYU0EtMjg5IChodHRwczovL3hlbmJpdHMu
eGVuLm9yZy94c2EvYWR2aXNvcnktMjg5Lmh0bWwpLiBUbyBibG9jayBzcGVjdWxhdGl2ZQpleGVj
dXRpb24gb24gSW50ZWwgaGFyZHdhcmUsIGFuIGxmZW5jZSBpbnN0cnVjdGlvbiBpcyByZXF1aXJl
ZCB0byBtYWtlIHN1cmUKdGhhdCBzZWxlY3RlZCBjaGVja3MgYXJlIG5vdCBieXBhc3NlZC4gU3Bl
Y3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGNhbgpiZSBwcmV2ZW50ZWQgYnkgdXNpbmcg
dGhlIGFycmF5X2luZGV4X25vc3BlYyBtYWNyby4KClRoZSBsZmVuY2UgaW5zdHJ1Y3Rpb24gc2hv
dWxkIGJlIGFkZGVkIG9uIHg4NiBwbGF0Zm9ybXMgb25seS4gVG8gbm90IGFmZmVjdApwbGF0Zm9y
bXMgdGhhdCBhcmUgbm90IGFmZmVjdGVkIGJ5IHRoZSBMMVRGIHZ1bG5lcmFiaWxpdHksIHRoZSBs
ZmVuY2UKaW5zdHJ1Y3Rpb24gaXMgcGF0Y2hlZCBpbiB2aWEgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcg
b24gTDFURiB2dWxuZXJhYmxlIENQVXMgb25seS4KVG8gY29udHJvbCB0aGUgcGF0Y2hpbmcgbWVj
aGFuaXNtLCBJIGludHJvZHVjZWQgYSBjb21tYW5kIGxpbmUgb3B0aW9uIGFuZCBhCnN5bnRoZXNp
emVkIENQVSBmZWF0dXJlIGZsYWcuCgoKQmVzdCwKTm9yYmVydAoKCgoKQW1hem9uIERldmVsb3Bt
ZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2No
YWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDog
REUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcg
SFJCIDE0OTE3MyBCCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
