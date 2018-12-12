From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Wed, 12 Dec 2018 10:09:38 -0800
Message-ID: <faae2cec-1ff2-74eb-69c8-b75f64cfca3a__16583.2046339803$1544638148$gmane$org@oracle.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I/mJ=OV=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1gX8xf-0006hO-66
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 18:10:19 +0000
In-Reply-To: <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, Maran Wilson <maran.wilson@oracle.com>, mchehab@kernel.org, jpoimboe@redhat.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, hch@infradead.org, mingo@redhat.com, tglx@linutronix.de, rdunlap@infradead.org, luto@kernel.org, hpa@zytor.com, boris.ostrovsky@oracle.com, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNi8yMDE4IDE6MjEgUE0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMDYvMTIvMTgg
MDc6MDIsIE1hcmFuIFdpbHNvbiB3cm90ZToKPj4gRm9yIGNlcnRhaW4gYXBwbGljYXRpb25zIGl0
IGlzIGRlc2lyYWJsZSB0byByYXBpZGx5IGJvb3QgYSBLVk0gdmlydHVhbAo+PiBtYWNoaW5lLiBJ
biBjYXNlcyB3aGVyZSBsZWdhY3kgaGFyZHdhcmUgYW5kIHNvZnR3YXJlIHN1cHBvcnQgd2l0aGlu
IHRoZQo+PiBndWVzdCBpcyBub3QgbmVlZGVkLCBRZW11IHNob3VsZCBiZSBhYmxlIHRvIGJvb3Qg
ZGlyZWN0bHkgaW50byB0aGUKPj4gdW5jb21wcmVzc2VkIExpbnV4IGtlcm5lbCBiaW5hcnkgd2l0
aG91dCB0aGUgbmVlZCB0byBydW4gZmlybXdhcmUuCj4+Cj4+IFRoZXJlIGFscmVhZHkgZXhpc3Rz
IGFuIEFCSSB0byBhbGxvdyB0aGlzIGZvciBYZW4gUFZIIGd1ZXN0cyBhbmQgdGhlIEFCSQo+PiBp
cyBzdXBwb3J0ZWQgYnkgTGludXggYW5kIEZyZWVCU0Q6Cj4+Cj4+ICAgICBodHRwczovL3hlbmJp
dHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MvcHZoLmh0bWwKPj4KPj4gVGhpcyBwYXRjaCBz
ZXJpZXMgd291bGQgZW5hYmxlIFFlbXUgdG8gdXNlIHRoYXQgc2FtZSBlbnRyeSBwb2ludCBmb3IK
Pj4gYm9vdGluZyBLVk0gZ3Vlc3RzLgo+IFRoYW5rcyEgIEkgc2hvdWxkIGJlIGFibGUgdG8gcG9z
dCBhIFRlc3RlZC1ieSBuZXh0IE1vbmRheS4gIEJvcmlzLCBhcmUKPiB5b3UgZ29pbmcgdG8gcGlj
ayBpdCB1cCBmb3IgNC4yMT8KCkhpIFBhb2xvLAoKQXJlIHlvdSBzdGlsbCBwbGFubmluZyBvbiBy
dW5uaW5nIHNvbWUgdGVzdGluZyBvZiB5b3VyIG93biBmb3IgdGhlc2UgCnBhdGNoZXM/IFNob3Vs
ZCBCb3JpcyB3YWl0IHRvIGhlYXIgZnJvbSB5b3UgYmVmb3JlIG1vdmluZyBmb3J3YXJkPwoKVGhh
bmtzLAotTWFyYW4KCj4gUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
