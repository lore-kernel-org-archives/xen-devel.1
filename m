From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 14:52:55 +0100
Message-ID: <d0fd8799-35ea-fba5-9d0d-94feead85943__6352.6745223955$1544190704$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <2c289956-0e6a-700c-605d-83685fbb08f9@suse.com>
 <0a2f692a-f7df-8ad1-9d34-96f5e36926db@redhat.com>
 <3f95d053-87aa-ad45-03e6-1e1977283eb4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JtOs=OQ=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gVGYz-000671-Cj
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 13:53:05 +0000
In-Reply-To: <3f95d053-87aa-ad45-03e6-1e1977283eb4@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTggMTQ6NTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gVGhlIFBWSCBib290IGVu
dHJ5IGlzIGluIHRoZSBzYW1lIGJ6SW1hZ2UgYmluYXJ5IGFzIHRoZSBub3JtYWwgb25lLgo+IEl0
cyBqdXN0IGFub3RoZXIgZW50cnksIHNpbWlsYXIgdG8gdGhlIFhlbiBQViBib290IGVudHJ5LiBT
byB0aGUgYmluYXJ5Cj4gYXJjaC94ODYvYm9vdC9iemltYWdlIGNhbiBiZSBib290ZWQgZWl0aGVy
IG9uIGJhcmUgbWV0YWwgdmlhIGdydWIyIG9yCj4gb3RoZXIgYm9vdC1sb2FkZXJzLCBhcyBYZW4g
UFYtZ3Vlc3QsIGFzIFhlbiBQVkgtZ3Vlc3QsIG9yIGFzIEtWTQo+IFBWSC1ndWVzdC4gU28gb25l
IGJ1aWxkIGFuZCBvbmUgYmluYXJ5LiBUaGUgbm9uLXN0YW5kYXJkIGJvb3QgZW50cmllcwo+IChQ
Vi0gb3IgUFZILW5vZGUpIGFyZSBmb3VuZCB2aWEgRUxGLW5vdGVzIGJ5IHRoZSBib290IGxvYWRl
ciAocWVtdSBpbgo+IGNhc2Ugb2YgS1ZNKS4KPiAKCkJ1dCB0aGUgYnpJbWFnZSBpcyBub3QgYW4g
RUxGIGJpbmFyeSwgYW5kIGl0IGlzIGNvbXByZXNzZWQsIGlzbid0IGl0PwovbWUgaXMgY29uZnVz
ZWQuIDopCgpQYW9sbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
