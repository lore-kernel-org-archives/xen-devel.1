From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [RFC PATCH v4 6/7] xen/pvh: Add memory map pointer
 to hvm_start_info struct
Date: Thu, 1 Mar 2018 10:23:40 -0500
Message-ID: <20180301152340.GI15623@char.us.oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-7-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=50r9=fx=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1erQ4G-0003l7-4B
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 15:24:24 +0000
Content-Disposition: inline
In-Reply-To: <1519842483-8887-7-git-send-email-maran.wilson@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, JBeulich@suse.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMTA6Mjg6MDJBTSAtMDgwMCwgTWFyYW4gV2lsc29uIHdy
b3RlOgo+IFRoZSBzdGFydCBpbmZvIHN0cnVjdHVyZSB0aGF0IGlzIGRlZmluZWQgYXMgcGFydCBv
ZiB0aGUgeDg2L0hWTSBkaXJlY3QgYm9vdAo+IEFCSSBhbmQgdXNlZCBmb3Igc3RhcnRpbmcgWGVu
IFBWSCBndWVzdHMgd291bGQgYmUgbW9yZSB2ZXJzYXRpbGUgaWYgaXQgYWxzbwo+IGluY2x1ZGVk
IGEgd2F5IHRvIHBhc3MgaW5mb3JtYXRpb24gYWJvdXQgdGhlIG1lbW9yeSBtYXAgdG8gdGhlIGd1
ZXN0LiBUaGlzCj4gd291bGQgYWxsb3cgS1ZNIGd1ZXN0cyB0byBzaGFyZSB0aGUgc2FtZSBlbnRy
eSBwb2ludC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJhbiBXaWxzb24gPG1hcmFuLndpbHNvbkBv
cmFjbGUuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3hlbi9pbnRlcmZhY2UvaHZtL3N0YXJ0X2luZm8u
aCB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQ5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS94ZW4vaW50ZXJmYWNlL2h2bS9zdGFydF9pbmZvLmggYi9pbmNsdWRlL3hlbi9pbnRlcmZh
Y2UvaHZtL3N0YXJ0X2luZm8uaAo+IGluZGV4IDY0ODQxNTk3NmVhZC4uODBjZmJkMzVjMWFmIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUveGVuL2ludGVyZmFjZS9odm0vc3RhcnRfaW5mby5oCj4gKysr
IGIvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2h2bS9zdGFydF9pbmZvLmgKPiBAQCAtMzMsNyArMzMs
NyBAQAo+ICAgKiAgICB8IG1hZ2ljICAgICAgICAgIHwgQ29udGFpbnMgdGhlIG1hZ2ljIHZhbHVl
IFhFTl9IVk1fU1RBUlRfTUFHSUNfVkFMVUUKPiAgICogICAgfCAgICAgICAgICAgICAgICB8ICgi
eEVuMyIgd2l0aCB0aGUgMHg4MCBiaXQgb2YgdGhlICJFIiBzZXQpLgo+ICAgKiAgNCArLS0tLS0t
LS0tLS0tLS0tLSsKPiAtICogICAgfCB2ZXJzaW9uICAgICAgICB8IFZlcnNpb24gb2YgdGhpcyBz
dHJ1Y3R1cmUuIEN1cnJlbnQgdmVyc2lvbiBpcyAwLiBOZXcKPiArICogICAgfCB2ZXJzaW9uICAg
ICAgICB8IFZlcnNpb24gb2YgdGhpcyBzdHJ1Y3R1cmUuIEN1cnJlbnQgdmVyc2lvbiBpcyAxLiBO
ZXcKCkhhdmUgeW91IGNoZWNrZWQgaWYgdGhlcmUgYXJlIGFueSBPU2VzIHRoYXQgZW5kIHVwIGNo
ZWNraW5nIHRoaXMgdmFsdWUgYXQgYWxsPwoKUGVyaGFwcyBhbHNvIGV4cGFuZCB0aGUgY29tbWVu
dCB0byBzYXkgdGhhdCBmb3IgUFYgZ3Vlc3RzIG9ubHkgMCBpcyBhbGxvd2VkLgpGb3IgUFZIIDAg
b3IgMSBpcyBhbGxvd2VkID8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
