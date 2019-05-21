From: Norbert Manthey <nmanthey@amazon.de>
Subject: L1TF MDS GT v1
Date: Tue, 21 May 2019 09:45:43 +0200
Message-ID: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+mW=TV=amazon.de=prvs=03752d4d0=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hSzTK-0007ju-5q
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 07:46:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

RGVhciBhbGwsCgpUaGlzIHBhdGNoIHNlcmllcyBhdHRlbXB0cyB0byBtaXRpZ2F0ZSB0aGUgaXNz
dWUgdGhhdCBoYXZlIGJlZW4gcmFpc2VkIGluIHRoZQpYU0EtMjg5IChodHRwczovL3hlbmJpdHMu
eGVuLm9yZy94c2EvYWR2aXNvcnktMjg5Lmh0bWwpLiBUbyBibG9jayBzcGVjdWxhdGl2ZQpleGVj
dXRpb24gb24gSW50ZWwgaGFyZHdhcmUsIGFuIGxmZW5jZSBpbnN0cnVjdGlvbiBpcyByZXF1aXJl
ZCB0byBtYWtlIHN1cmUKdGhhdCBzZWxlY3RlZCBjaGVja3MgYXJlIG5vdCBieXBhc3NlZC4gU3Bl
Y3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGNhbgpiZSBwcmV2ZW50ZWQgYnkgdXNpbmcg
dGhlIGFycmF5X2luZGV4X25vc3BlYyBtYWNyby4KClRoaXMgc2VyaWVzIHBpY2tzIHVwIHRoZSBs
YXN0IHJlbWFpbmluZyBjb21taXQgb2YgbXkgcHJldmlvdXMgTDFURiBzZXJpZXMsIGFuZApzcGxp
dHMgaXQgaW50byB0aHJlZSBjb21taXRzIHRvIGhlbHAgdGFyZ2V0dGluZyB0aGUgZGlzY3Vzc2lv
biBiZXR0ZXIuIFRoZQphY3R1YWwgY2hhbmdlIGlzIHRvIHByb3RlY3QgdGhyZWUgbW9yZSBmdW5j
dGlvbnMgZm9yIGdyYW50LXRhYmxlIHZlcnNpb24KZGVwZW5kZW50IGNvZGUgZXhlY3V0aW9uLgoK
VGhpcyBpcyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0LiBBcyBmb3Ig
ZXhhbXBsZSBtZW50aW9uZWQKaW4gWzFdLCB0aGVzZSBjaGFuZ2VzIGFsc28gaGVscCB0byBsaW1p
dCBsZWFrcyB2aWEgdGhlIE1EUyB2dWxuZXJhYmlsaXR5LgoKQmVzdCwKTm9yYmVydAoKWzFdIGh0
dHBzOi8vYXJ4aXYub3JnL2Ficy8xOTA1LjA1NzI2CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2Vu
dGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1
ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkg
MjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5
MTczIEIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
