From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] xen-netfront: Fix hang on device removal
Date: Thu, 19 Apr 2018 14:14:43 -0400
Message-ID: <CAKf6xpuusCJ0DMJ_G3hG5pd9vd8rUBH=VPa4TCvaoptGto-=Zw__27279.1001866155$1524161608$gmane$org@mail.gmail.com>
References: <20180228122323.3914-1-jandryuk@gmail.com>
 <1b07e839-5633-3b1e-1997-b86a891b2962@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=njkc=hi=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1f9E50-00040I-6d
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 18:14:46 +0000
Received: by mail-lf0-x230.google.com with SMTP id m202-v6so1492775lfe.8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Apr 2018 11:14:44 -0700 (PDT)
In-Reply-To: <1b07e839-5633-3b1e-1997-b86a891b2962@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Eduardo Otubo <otubo@redhat.com>, Juergen Gross <jgross@suse.com>, netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMjoxMCBQTSwgU2ltb24gR2Fpc2VyCjxzaW1vbkBpbnZp
c2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPiBKYXNvbiBBbmRyeXVrOgo+PiBBIHRvb2xzdGFj
ayBtYXkgZGVsZXRlIHRoZSB2aWYgZnJvbnRlbmQgYW5kIGJhY2tlbmQgeGVuc3RvcmUgZW50cmll
cwo+PiB3aGlsZSB4ZW4tbmV0ZnJvbnQgaXMgaW4gdGhlIHJlbW92YWwgY29kZSBwYXRoLiAgSW4g
dGhhdCBjYXNlLCB0aGUKPj4gY2hlY2tzIGZvciB4ZW5idXNfcmVhZF9kcml2ZXJfc3RhdGUgd291
bGQgcmV0dXJuIFhlbmJ1c1N0YXRlVW5rbm93biwgYW5kCj4+IHhlbm5ldF9yZW1vdmUgd291bGQg
aGFuZyBpbmRlZmluaXRlbHkuICBUaGlzIGhhbmcgcHJldmVudHMgc3lzdGVtCj4+IHNodXRkb3du
Lgo+Pgo+PiB4ZW5uZXRfcmVtb3ZlIG11c3QgYmUgYWJsZSB0byBoYW5kbGUgWGVuYnVzU3RhdGVV
bmtub3duLCBhbmQKPj4gbmV0YmFja19jaGFuZ2VkIG11c3QgYWxzbyB3YWtlIHVwIHRoZSB3YWtl
X3F1ZXVlIGZvciB0aGF0IHN0YXRlIGFzIHdlbGwuCj4+Cj4+IEZpeGVzOiA1YjU5NzFkZjNiYzIg
KCJ4ZW4tbmV0ZnJvbnQ6IHJlbW92ZSB3YXJuaW5nIHdoZW4gdW5sb2FkaW5nIG1vZHVsZSIpCj4K
PiBJIHRoaW5rIHRoaXMgc2hvdWxkIGdvIGludG8gc3RhYmxlIHNpbmNlIEFGQUlLIHRoZSBoYW5n
aW5nIG5ldHdvcmsKPiBkZXZpY2UgY2FuIG9ubHkgYmUgZml4ZWQgYnkgcmVib290aW5nIHRoZSBn
dWVzdC4gQUZBSUNTIHRoaXMgYWZmZWN0cyBhbGwKPiA0LiogYnJhbmNoZXMgc2luY2UgNWI1OTcx
ZGYzYmMyIGdvdCBiYWNrcG9ydGVkIHRvIHRoZW0uCj4KPiBVcHN0cmVhbSBjb21taXQgYzJkMmU2
NzM4YTIwOWYwZjlkZmZhMmRjOGU3MjkyZmM0NTM2MGQ2MS4KClNpbW9uLAoKWWVzLCBJIGFncmVl
LiAgSSBhY3R1YWxseSBzdWJtaXR0ZWQgdGhlIHJlcXVlc3QgdG8gc3RhYmxlIGVhcmxpZXIKdG9k
YXksIHNvIGhvcGVmdWxseSBpdCBnZXRzIGFkZGVkIHNvb24uCgpIYXZlIHlvdSBleHBlcmllbmNl
ZCB0aGlzIGhhbmc/CgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
