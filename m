From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [PATCH v9 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Wed, 12 Dec 2018 13:56:17 -0800
Message-ID: <8483ef47-cd95-8d73-0a2f-2a65d262e2d9__39308.7006909356$1544651747$gmane$org@oracle.com>
References: <1544468734-32763-1-git-send-email-maran.wilson@oracle.com>
 <20181211131825.GD27375@zn.tnic>
 <5fc083d4-1dbd-f2f9-3059-0e3e8dda9b25@oracle.com>
 <20181212203901.GI6653@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I/mJ=OV=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1gXCV6-00055b-Om
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 21:57:04 +0000
In-Reply-To: <20181212203901.GI6653@zn.tnic>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, boris.ostrovsky@oracle.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8xMi8yMDE4IDEyOjM5IFBNLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4gT24gVHVl
LCBEZWMgMTEsIDIwMTggYXQgMTE6Mjk6MjFBTSAtMDgwMCwgTWFyYW4gV2lsc29uIHdyb3RlOgo+
PiBJcyB5b3VyIHF1ZXN0aW9uIGFib3V0IHdoYXQgb3B0aW9ucyB5b3UgbmVlZCB0byBwcm92aWRl
IHRvIFFlbXU/IE9yIGlzIHlvdXIKPj4gcXVlc3Rpb24gYWJvdXQgdGhlIFNXIGltcGxlbWVudGF0
aW9uIGNob2ljZXM/Cj4+Cj4+IEFzc3VtaW5nIHRoZSBmb3JtZXIuLi4KPiBZZWFoLCB0aGF0J3Mg
d2hhdCBJIHdhbnRlZCB0byBrbm93LiBCdXQgbG9va2luZyBhdCBpdCwgSSdtIGJvb3RpbmcKPiBi
ekltYWdlIGhlcmUganVzdCBhcyBxdWlja2x5IGFuZCBhcyBmbGV4aWJsZSBzbyBJIGRvbid0IHNl
ZSB0aGUKPiBhZHZhbnRhZ2Ugb2YgdGhpcyBuZXcgbWV0aG9kIGZvciBteSB1c2UgY2FzZSBoZXJl
IG9mIGJvb3Rpbmcga2VybmVscwo+IGluIHFlbXUuCj4KPiBCdXQgbWF5YmUgdGhlcmUncyBhIGdv
b2QgdXNlIGNhc2Ugd2hlcmUgZmlybXdhcmUgaXMgc2xvdyBhbmQgb25lIGRvZXNuJ3QKPiByZWFs
bHkgd2FubmEgbm9vZGxlIHRocm91Z2ggaXQgb3Igd2hlbiBvbmUgZG9lcyBzdGFydCBhIGdhemls
bGlvbiBWTXMKPiBwZXIgc2Vjb25kIG9yIHdoYXRldmVyLi4uCgpSaWdodCwgdGhlIHRpbWUgc2F2
ZWQgaXMgbm90IHNvbWV0aGluZyB5b3Ugd291bGQgbm90aWNlIHdoaWxlIHN0YXJ0aW5nIGEgClZN
IG1hbnVhbGx5LiBCdXQgaXQgZG9lcyByZWR1Y2UgdGhlIHRpbWUgdG8gcmVhY2ggc3RhcnR1cF82
NCgpIGluIExpbnV4IApieSBhYm91dCA1MCUgKGdvaW5nIGZyb20gYXJvdW5kIDk0bXMgdG8gYXJv
dW5kIDQ3bXMpIHdoZW4gYm9vdGluZyBhIFZNIAp1c2luZyBRZW11K3Fib290IChmb3IgZXhhbXBs
ZSkuIFRoYXQgdGltZSBzYXZpbmdzIGJlY29tZXMgcHJldHR5IAppbXBvcnRhbnQgd2hlbiB5b3Ug
YXJlIHRyeWluZyB0byB1c2UgVk1zIGFzIGNvbnRhaW5lcnMgKGZvciBpbnN0YW5jZSwgYXMgCmlz
IHRoZSBjYXNlIHdpdGggS2F0YSBjb250YWluZXJzKSBhbmQgdHJ5aW5nIHRvIGdldCB0aGUgbGF0
ZW5jeSBmb3IgCmxhdW5jaGluZyBzdWNoIGEgY29udGFpbmVyIHJlYWxseSBsb3cgLS0gdG8gY29t
ZSBhcyBjbG9zZSBhcyBwb3NzaWJsZSB0byAKbWF0Y2ggdGhlIGxhdGVuY3kgZm9yIGxhdW5jaGlu
ZyBtb3JlIHRyYWRpdGlvbmFsIGNvbnRhaW5lcnMgdGhhdCBkb24ndCAKaGF2ZSB0aGUgYWRkaXRp
b25hbCBzZWN1cml0eS9pc29sYXRpb24gb2YgcnVubmluZyB3aXRoaW4gYSBzZXBhcmF0ZSBWTS4K
ClRoYW5rcywKLU1hcmFuCgo+Cj4gVGh4Lgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
