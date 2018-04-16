From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: init %gs very early to avoid page
 faults with stack protector
Date: Mon, 16 Apr 2018 07:43:23 +0200
Message-ID: <ec006143-70a1-0554-d352-daf6b08af4c8@suse.com>
References: <cfd09166-352d-cbcf-961e-a3070831a713@nachtgeist.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=dujn=hf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f7wvI-0007Av-L9
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 05:43:28 +0000
In-Reply-To: <cfd09166-352d-cbcf-961e-a3070831a713@nachtgeist.net>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Reichelt <hacking@nachtgeist.net>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDQvMTggMDc6NTUsIERhbmllbCBSZWljaGVsdCB3cm90ZToKPiBIaSwKPiAKPiB0aGUg
cGF0Y2ggdjIgc29sdmVkIHRoZSBpc3N1ZSBmb3IgbWUgb25seSBvbiBhbWQ2NCwgaTM4NiBndWVz
dHMga2VlcCBjcmFzaGluZwo+IHdpdGggbGludXggNC4xNSwgNC4xNCB3b3JrcyBmaW5lLgoKVXBz
dHJlYW0gY29tbWl0IDM2MTA0Y2I5MDEyYTgyZTczYzMyYTNiNzA5MjU3NzY2YjE2YmNkMWQgZml4
ZWQgdGhhdC4gSXQKbmVlZHMgdG8gYmUgYWRkZWQgdG8gc3RhYmxlIGFzIHdlbGwuCgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
