From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v1 06/15] arm64: Add accessors for the
 ICH_APxRn_EL2 registers
Date: Mon, 26 Mar 2018 15:36:36 +0100
Message-ID: <30725638-bf93-f179-19d2-46ec9100cbc3@arm.com>
References: <cover.1521200294.git.manish.jaggi@cavium.com>
 <4eac61feb5626c48243c12d3f08b21bb84b8aea8.1521200294.git.manish.jaggi@cavium.com>
 <f8a23176-c12d-6a09-e862-9e0f28d34f7b@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ukjg=gq=arm.com=marc.zyngier@srs-us1.protection.inumbo.net>)
 id 1f0TEo-0006jA-Hf
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 14:36:42 +0000
In-Reply-To: <f8a23176-c12d-6a09-e862-9e0f28d34f7b@caviumnetworks.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Manish Jaggi <manish.jaggi@cavium.com>, xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDMvMTggMTQ6MTksIE1hbmlzaCBKYWdnaSB3cm90ZToKPiBIaSBNYXJjLAo+IAo+IEkg
aGF2ZSBhIHF1ZXJ5IG9uIHRoaXMgcGF0Y2guIFRoZSBvcmlnaW5hbCBwYXRjaCB3YXMgdXNpbmcg
dGhlc2UgCj4gZnVuY3Rpb25zIHNvIGl0IHdhcyBvayB0byBtYWtlIHRoZW0gc3RhdGljLgo+IEJ1
dCB0aGlzIHBhdGNoIGlzIG5vdCB0b3VjaGluZyB0aGUgeGVuIHZnaWMgY29kZSBzaW1pbGFyIHRv
IHdoYXQgeW91ciAKPiBwYXRjaCBkaWQuCj4gCj4gV2lsbCBpdCBiZSBvayB0byBtZXJnZSB0aGlz
IHBhdGNoIHdpdGggCj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYXJtLWtlcm5lbC9t
c2c1ODcwODkuaHRtbAoKSSBjYW4gb25seSByZXBlYXQgdGhlIGFyZ3VtZW50IEkgdHJ5IHRvIGNv
bnZleSBlYXJsaWVyLiBCeSBjaGFuZ2luZyB0aGUKc3RydWN0dXJlIG9mIHRoZSBzZXJpZXMsIHlv
dSdyZSBtYWtpbmcgaXQgaGFyZGVyIHRvIHJldmlldyBpdCwgYXMgaXQgaXMKbm90IHBvc3NpYmxl
IHRvIGxvb2sgYXQgdHdvIHBhdGNoZXMgc2lkZSBieSBzaWRlIGFuZCB3b3JrIG91dCB3aGF0IGNo
YW5nZWQuCgpJbiB0aGUgZW5kLCB0aGF0J3MgeW91ciBjYWxsLiBJZiB5b3Ugd2FudCB0byBjaGFu
Z2UgdGhlIHNoYXBlIG9mIHRoZQpzZXJpZXMsIGdvIGZvciBpdC4gQnV0IGFsc28gYXBwcmVjaWF0
ZSB0aGUgY29uc2VxdWVuY2VzIG9mIGRvaW5nIHNvLgoKCU0uCi0tIApKYXp6IGlzIG5vdCBkZWFk
LiBJdCBqdXN0IHNtZWxscyBmdW5ueS4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
