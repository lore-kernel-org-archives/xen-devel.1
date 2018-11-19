From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v7 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Mon, 19 Nov 2018 19:25:43 +0100
Message-ID: <a0156b30-2e67-b68b-d555-a255acf2098e__25721.9210536734$1542651881$gmane$org@redhat.com>
References: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
 <9aeeaf85-6ecf-c1e2-640a-657f5bb0f8ef@redhat.com>
 <bf0112de-8ceb-d1e4-d787-bf6bde7a1f14@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ddue=n6=gmail.com=paolo.bonzini@srs-us1.protection.inumbo.net>)
 id 1gOoF3-0000dP-Q1
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 18:25:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id t15-v6so6276211wmt.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Nov 2018 10:25:47 -0800 (PST)
In-Reply-To: <bf0112de-8ceb-d1e4-d787-bf6bde7a1f14@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, jgross@suse.com
Cc: luto@kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, hpa@zytor.com, boris.ostrovsky@oracle.com, hch@infradead.org, mingo@redhat.com, bp@suse.de, Stefano Garzarella <sgarzare@redhat.com>, thomas.lendacky@amd.com, Stefan Hajnoczi <stefanha@redhat.com>, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, George Kennedy <george.kennedy@oracle.com>, Liam Merwick <liam.merwick@oracle.com>, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMTEvMTggMTg6MTcsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBPbiAxMS8xNi8yMDE4IDI6
NDYgQU0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4+IE9uIDE3LzA0LzE4IDAxOjA5LCBNYXJhbiBX
aWxzb24gd3JvdGU6Cj4+PiBGb3IgY2VydGFpbiBhcHBsaWNhdGlvbnMgaXQgaXMgZGVzaXJhYmxl
IHRvIHJhcGlkbHkgYm9vdCBhIEtWTSB2aXJ0dWFsCj4+PiBtYWNoaW5lLiBJbiBjYXNlcyB3aGVy
ZSBsZWdhY3kgaGFyZHdhcmUgYW5kIHNvZnR3YXJlIHN1cHBvcnQgd2l0aGluIHRoZQo+Pj4gZ3Vl
c3QgaXMgbm90IG5lZWRlZCwgUWVtdSBzaG91bGQgYmUgYWJsZSB0byBib290IGRpcmVjdGx5IGlu
dG8gdGhlCj4+PiB1bmNvbXByZXNzZWQgTGludXgga2VybmVsIGJpbmFyeSB3aXRob3V0IHRoZSBu
ZWVkIHRvIHJ1biBmaXJtd2FyZS4KPj4+Cj4+PiBUaGVyZSBhbHJlYWR5IGV4aXN0cyBhbiBBQkkg
dG8gYWxsb3cgdGhpcyBmb3IgWGVuIFBWSCBndWVzdHMgYW5kIHRoZSBBQkkKPj4+IGlzIHN1cHBv
cnRlZCBieSBMaW51eCBhbmQgRnJlZUJTRDoKPj4+Cj4+PiDCoMKgwqAgaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3B2aC5odG1sCj4+Pgo+Pj4gVGhpcyBwYXRjaCBz
ZXJpZXMgd291bGQgZW5hYmxlIFFlbXUgdG8gdXNlIHRoYXQgc2FtZSBlbnRyeSBwb2ludCBmb3IK
Pj4+IGJvb3RpbmcgS1ZNIGd1ZXN0cy4KPj4gSGkgTWFyYW4sIHdoYXQgaGFwcGVuZWQgdG8gdGhp
cyBzZXJpZXMgKGFuZCB0byB0aGUgUUVNVSB3b3JrKT8KPiAKPiBIaSBQYW9sbywKPiAKPiBUaGFu
ayB5b3UgZm9yIHRoZSByZW1pbmRlci4gU29ycnksIEkgaGF2ZSBiZWVuIHdhbnRpbmcgdG8gY29u
dGludWUgdGhpcwo+IHdvcmsgZm9yIGEgd2hpbGUgbm93LCBidXQgb3VyIHRlYW0gaGFzIGJlZW4g
cHVsbGVkIGluIG90aGVyIGRpcmVjdGlvbnMKPiBhbmQgdGhpcyBvbmUgZW5kZWQgdXAgZ2V0dGlu
ZyB0ZW1wb3JhcmlseSBwdXNoZWQgZG93biB0aGUgcHJpb3JpdHkgc3RhY2suCj4gCj4gTGV0IG1l
IGRpc2N1c3Mgd2l0aCBteSBtYW5hZ2VtZW50IGFuZCBnZXQgYmFjayB0byB5b3UuIEkgZG8gd2Fu
dCAoYW5kCj4gaW50ZW5kKSB0byBzdXBwb3J0IGFuZCBwdXNoIHRoaXMgb3ZlciB0aGUgZmluaXNo
IGxpbmUuCj4gCj4gSW4gdGhlIG1lYW50aW1lLCBpZiB0aGVyZSBhcmUgYW55IGZvbGtzIG91dCB0
aGVyZSB3aXRoIGEgc3BlY2lmaWMKPiBidXNpbmVzcyBuZWVkIGZvciBnZXR0aW5nIHRoaXMgZG9u
ZSBzb29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIKCldlbGwsIHdlIGFyZSBpbnRlcmVzdGVkIGluIHVz
aW5nIHRoaXMgdG8gYXZvaWQgdGhlIGRlY29tcHJlc3Npb24gY29zdCBvZgpib290aW5nIGEgImNv
bnRhaW5lci1saWtlIiBWTSBpbWFnZS4gIEknbSBub3Qgc3VyZSB3aGF0IHdlIHdpbGwgZG8gYWJv
dXQKdGhhdCwgYnV0IGNlcnRhaW5seSBnZXR0aW5nIHRoaXMgaW5jbHVkZWQgaW4gdGhlIHVwc3Ry
ZWFtIHByb2plY3RzIHdvdWxkCmJlIGEgcHJlcmVxdWlzaXRlLgoKSWYgeW91IHJlYWxseSBwcmVm
ZXIgdG8gZGlzY3VzcyB0aGluZ3Mgb2ZmbGlzdCwgZmVlbCBmcmVlIHRvIGluY2x1ZGUgbWUsClN0
ZWZhbiBhbmQgU3RlZmFuby4KClBhb2xvCgo+IGFuZCBhcmUKPiBhYmxlIHRvIGludmVzdCBhIGJp
dCBvZiB0aW1lIHRvIGNvbGxhYm9yYXRlIG9uIHRoZSByZW1haW5pbmcgUWVtdSB3b3JrLAo+IHBs
ZWFzZSBmZWVsIGZyZWUgdG8gcGluZyBtZSBvZmZsaW5lLiBXZSBoYXZlIHNvbWUgcHJlbGltaW5h
cnkgUWVtdQo+IHBhdGNoZXMsIGJ1dCB0aGVyZSBpcyBzb21lIGFkZGl0aW9uYWwgd29yayBuZWVk
ZWQgYmVmb3JlIHRoZXkgYXJlIHJlYWR5Cj4gd2lkZXIgcmV2aWV3Lgo+IAo+IFRoYW5rcywKPiAt
TWFyYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
