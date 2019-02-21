From: Norbert Manthey <nmanthey@amazon.de>
Subject: SpectreV1+L1TF Patch Series v7
Date: Thu, 21 Feb 2019 09:16:34 +0100
Message-ID: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rINu=Q4=amazon.de=prvs=9484abbec=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gwjZc-0000tO-DT
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 08:19:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

RGVhciBhbGwsCgpUaGlzIHBhdGNoIHNlcmllcyBhdHRlbXB0cyB0byBtaXRpZ2F0ZSB0aGUgaXNz
dWUgdGhhdCBoYXZlIGJlZW4gcmFpc2VkIGluIHRoZQpYU0EtMjg5IChodHRwczovL3hlbmJpdHMu
eGVuLm9yZy94c2EvYWR2aXNvcnktMjg5Lmh0bWwpLCBuYW1lbHkgdG8gYXZvaWQKdG91Y2hpbmcg
bWVtb3J5IGZyb20gdGhlIGh5cGVydmlzb3Igc3BlY3VsYXRpdmVseSB0aGF0IHdvdWxkIG5vdCBi
ZSB0b3VjaGVkCndpdGhvdXQgc3BlY3VsYXRpb24uIFRvIGJsb2NrIHNwZWN1bGF0aXZlIGV4ZWN1
dGlvbiBvbiBJbnRlbCBoYXJkd2FyZSwgYW4KbGZlbmNlIGluc3RydWN0aW9uIGlzIHJlcXVpcmVk
IHRvIG1ha2Ugc3VyZSB0aGF0IHNlbGVjdGVkIGNoZWNrcyBhcmUgbm90CmJ5cGFzc2VkLiBTcGVj
dWxhdGl2ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMgY2FuIGJlIHByZXZlbnRlZCBieSB1c2luZyB0
aGUKYXJyYXlfaW5kZXhfbm9zcGVjIG1hY3JvLgoKVGhlIG1ham9yIGNoYW5nZXMgYmV0d2VlbiB2
NiBhbmQgdjcgb2YgdGhpcyBzZXJpZXMgYXJlIHByZWZlcnJpbmcgdGhlIGxmZW5jZQppbnN0cnVj
dGlvbiB0byBibG9jayBzcGVjdWxhdGlvbiBvdmVyIHVwZGF0aW5nIHZhcmlhYmxlcy4gRnVydGhl
cm1vcmUsIHdoZW4KcGF0Y2hpbmcgaW4gdGhlIGxmZW5jZSBpbnN0cnVjdGlvbiBhdXRvbWF0aWNh
bGx5LCB0aGUgc2V0dGluZyBvZiBzbXQgYW5kIGwxZApmbHVzaGluZyBhcmUgdGFrZW4gaW50byBh
Y2NvdW50LgoKQmVzdCwKTm9yYmVydAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJt
YW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBD
aHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkK
RWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
