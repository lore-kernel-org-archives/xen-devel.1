From: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [PATCH RFC 00/39] x86/KVM: Xen HVM guest support
Date: Wed, 20 Feb 2019 16:31:53 -0800
Message-ID: <292773f7-5a4d-ba00-8398-0c8b81766b93__7587.86622188694$1550709165$gmane$org@oracle.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
 <20190220233941.GA5279@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GiMu=Q4=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1gwcHO-0000Hg-8E
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 00:31:58 +0000
In-Reply-To: <20190220233941.GA5279@mail-itl>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Joao Martins <joao.m.martins@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyLzIwLzE5IDM6MzkgUE0sIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToK
PiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwODoxNTozMFBNICswMDAwLCBKb2FvIE1hcnRpbnMg
d3JvdGU6Cj4+ICAgMi4gUFYgRHJpdmVyIHN1cHBvcnQgKHBhdGNoZXMgMTcgLSAzOSkKPj4KPj4g
ICBXZSBzdGFydCBieSByZWRpcmVjdGluZyBoeXBlcmNhbGxzIGZyb20gdGhlIGJhY2tlbmQgdG8g
cm91dGluZXMKPj4gICB3aGljaCBlbXVsYXRlIHRoZSBiZWhhdmlvdXIgdGhhdCBQViBiYWNrZW5k
cyBleHBlY3QgaS5lLiBncmFudAo+PiAgIHRhYmxlIGFuZCBpbnRlcmRvbWFpbiBldmVudHMuIE5l
eHQsIHdlIGFkZCBzdXBwb3J0IGZvciBsYXRlCj4+ICAgaW5pdGlhbGl6YXRpb24gb2YgeGVuYnVz
LCBmb2xsb3dlZCBieSBpbXBsZW1lbnRpbmcKPj4gICBmcm9udGVuZC9iYWNrZW5kIGNvbW11bmlj
YXRpb24gbWVjaGFuaXNtcyAoaS5lLiBncmFudCB0YWJsZXMgYW5kCj4+ICAgaW50ZXJkb21haW4g
ZXZlbnQgY2hhbm5lbHMpLiBGaW5hbGx5LCBpbnRyb2R1Y2UgeGVuLXNoaW0ua28sCj4+ICAgd2hp
Y2ggd2lsbCBzZXR1cCBhIGxpbWl0ZWQgWGVuIGVudmlyb25tZW50LiBUaGlzIHVzZXMgdGhlIGFk
ZGVkCj4+ICAgZnVuY3Rpb25hbGl0eSBvZiBYZW4gc3BlY2lmaWMgc2hhcmVkIG1lbW9yeSAoZ3Jh
bnQgdGFibGVzKSBhbmQKPj4gICBub3RpZmljYXRpb25zIChldmVudCBjaGFubmVscykuCj4gCj4g
RG9lcyBpdCBtZWFuIGJhY2tlbmRzIGNvdWxkIGJlIHJ1biBpbiBhbm90aGVyIGd1ZXN0LCBzaW1p
bGFybHkgYXMgb24KPiByZWFsIFhlbj8gQUZBSUsgdmlydGlvIGRvZXNuJ3QgYWxsb3cgdGhhdCBh
cyB2aXJ0aW8gYmFja2VuZHMgbmVlZApJJ20gYWZyYWlkIG5vdC4gRm9yIG5vdyBncmFudCBvcGVy
YXRpb25zIChtYXAvdW5tYXApIGNhbiBvbmx5IGJlIGRvbmUKYnkgYmFja2VuZHMgdG8gdGhlIGxv
Y2FsIEtWTSBpbnN0YW5jZS4KCkFua3VyCgo+IGFyYml0cmFyeSB3cml0ZSBhY2Nlc3MgdG8gZ3Vl
c3QgbWVtb3J5LiBCdXQgZ3JhbnQgdGFibGVzIHByb3ZpZGUgZW5vdWdoCj4gYWJzdHJhY3Rpb24g
dG8gZG8gdGhhdCBzYWZlbHkuCgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
