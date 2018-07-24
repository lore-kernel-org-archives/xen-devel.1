From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Wed, 25 Jul 2018 00:02:55 +0200 (CEST)
Message-ID: <nycvar.YFH.7.76.1807242351500.997@cbobk.fhfr.pm>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
 <nycvar.YFH.7.76.1807232357440.997@cbobk.fhfr.pm>
 <e57d5ac9-68d7-8ccf-6117-5a2f9d9e1112@csail.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=onmm=ki=kernel.org=jikos@srs-us1.protection.inumbo.net>)
 id 1fi5Oa-0005oT-0b
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 22:03:04 +0000
In-Reply-To: <e57d5ac9-68d7-8ccf-6117-5a2f9d9e1112@csail.mit.edu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Dave Hansen <dave@sr71.net>, Wanpeng Li <kernellwp@gmail.com>, Andi Kleen <ak@linux.intel.com>, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, arjan.van.de.ven@intel.com, xen-devel@lists.xenproject.org, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?ISO-8859-15?Q?Micka=EBlSala=FCn?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>, KarimAllah Ahmed <karahmed@amazon.de>, Dave Hansen <dave.hansen@linux.intel.com>lin
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNCBKdWwgMjAxOCwgU3JpdmF0c2EgUy4gQmhhdCB3cm90ZToKCj4gSG93ZXZlciwg
aWYgeW91IGFyZSBwcm9wb3NpbmcgdGhhdCB5b3UnZCBsaWtlIHRvIGNvbnRyaWJ1dGUgdGhlIGVu
aGFuY2VkIAo+IFBUSS9TcGVjdHJlICh1cHN0cmVhbSkgcGF0Y2hlcyBmcm9tIHRoZSBTTEVTIDQu
NCB0cmVlIHRvIDQuNCBzdGFibGUsIGFuZCAKPiBoYXZlIHRoZW0gbWVyZ2VkIGluc3RlYWQgb2Yg
dGhpcyBwYXRjaCBzZXJpZXMsIHRoZW4gSSB3b3VsZCBjZXJ0YWlubHkgCj4gd2VsY29tZSBpdCEK
CkknZCBpbiBwcmluY2lwbGUgbG92ZSB1cyB0byBwdXNoIGV2ZXJ5dGhpbmcgYmFjayB0byA0LjQs
IGJ1dCB0aGVyZSBhcmUgYSAKZmV3IHJlYXNvbnMgKCopIHdoeSB0aGF0J3Mgbm90IGhhcHBlbmlu
ZyBzaG9ydGx5LgoKQW55d2F5LCB0byBwb2ludCBvdXQgZXhwbGljaXRseSB3aGF0J3MgcmVhbGx5
IG5lZWRlZCBmb3IgdGhvc2UgZm9sa3MgCnJ1bm5pbmcgNC40LXN0YWJsZSBhbmQgcmVseWluZyBv
biBQVEkgcHJvdmlkaW5nIFRoZSBSZWFsIFRoaW5nKFRNKSwgaXQncyAKZWl0aGVyIGEgNC40LXN0
YWJsZSBwb3J0IG9mCgoJaHR0cDovL2tlcm5lbC5zdXNlLmNvbS9jZ2l0L2tlcm5lbC1zb3VyY2Uv
cGxhaW4vcGF0Y2hlcy5zdXNlL3g4Ni1lbnRyeS02NC11c2UtYS1wZXItY3B1LXRyYW1wb2xpbmUt
c3RhY2sucGF0Y2g/aWQ9MzQyOGE3N2IwMmIxYmEwM2U0NWQ4ZmMzNTJlYzM1MDQyOWY1N2ZjNwoK
b3IgbWFraW5nIFRIUkVBRElORk9fR0ZQIGltcGx5IF9fR0ZQX1pFUk8uCgooKikgSUJSUyBpcyBu
b3QgdXBzdHJlYW0sIHdlIGhpc3RvcmljYWxseSBoYXZlIGhhZCB2ZXJ5IGRpZmZlcmVudCB4ODYg
CiAgICBjb2RlYmFzZSBjb21wYXJlZCB0byBlaXRoZXIgNC40LCA0LjQtc3RhYmxlIG9yIGN1cnJl
bnQgTGludXMnIHRyZWUsIAogICAgYW5kIHRoZXJlIGFyZSBzaW1wbHkgdG9vIG1hbnkgdGhpbmdz
IGhhcHBlbmluZyByaWdodCBub3cgdG8gZ2l2ZSB0aGlzIAogICAgaGlnaCBlbm91Z2ggcHJpb3Jp
dHksIHNhZGx5LiBXZSdyZSBub3QgZnVsbHktZGVwZW5kZW50IGRvd25zdHJlYW0gCiAgICBjb25z
dW1lciBvZiAtc3RhYmxlIGFueSBtb3JlLCBzbyB0aGlzIGlzIG9uZSBvZiB0aGUgZXhwZWN0ZWQg
b3V0Y29tZXMsIAogICAgdW5mb3J0dW5hdGVseTsgd2UgZG9uJ3QgaW1tZWRpYXRlbHkgYmVuZWZp
dCBmcm9tIHB1c2hpbmcgb3VyIAogICAgZG93bnN0cmVhbSBjaGFuZ2VzIHRvIHN0YWJsZSwgYXMg
d2UgaGF2ZSB0byBjYXJyeSB0aG9zZSBvdmVyIGZvcndhcmQKICAgIG91cnNlbHZlcyBhbnl3YXku
CgpUaGFua3MsCgotLSAKSmlyaSBLb3NpbmEKU1VTRSBMYWJzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
