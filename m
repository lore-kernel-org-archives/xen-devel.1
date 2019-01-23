From: Norbert Manthey <nmanthey@amazon.de>
Subject: SpectreV1+L1TF Patch Series
Date: Wed, 23 Jan 2019 12:51:14 +0100
Message-ID: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eBhM=P7=amazon.de=prvs=91940689d=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gmH6r-0002PK-QA
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 11:54:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
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
b24gSW50ZWwgQ1BVcyBvbmx5LgpGdXJ0aGVybW9yZSwgdGhlIGNvbXBpbGUgdGltZSBjb25maWd1
cmF0aW9uIGFsbG93cyB0byBjaG9vc2UgaG93IHRvIHByb3RlY3QgdGhlCmV2YWx1YXRpb24gb2Yg
Y29uZGl0aW9ucyB3aXRoIHRoZSBsZmVuY2UgaW5zdHJ1Y3Rpb24uCgpCZXN0LApOb3JiZXJ0CgoK
CgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAox
MDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYg
SGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNo
dCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
