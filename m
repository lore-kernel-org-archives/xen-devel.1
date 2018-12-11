From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v9 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Tue, 11 Dec 2018 14:18:25 +0100
Message-ID: <20181211131825.GD27375__9069.34180898151$1544534242$gmane$org@zn.tnic>
References: <1544468734-32763-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2PnS=OU=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gWhvp-0005C3-W1
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 13:18:38 +0000
Content-Disposition: inline
In-Reply-To: <1544468734-32763-1-git-send-email-maran.wilson@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, boris.ostrovsky@oracle.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTAsIDIwMTggYXQgMTE6MDU6MzRBTSAtMDgwMCwgTWFyYW4gV2lsc29uIHdy
b3RlOgo+IEZvciBjZXJ0YWluIGFwcGxpY2F0aW9ucyBpdCBpcyBkZXNpcmFibGUgdG8gcmFwaWRs
eSBib290IGEgS1ZNIHZpcnR1YWwKPiBtYWNoaW5lLiBJbiBjYXNlcyB3aGVyZSBsZWdhY3kgaGFy
ZHdhcmUgYW5kIHNvZnR3YXJlIHN1cHBvcnQgd2l0aGluIHRoZQo+IGd1ZXN0IGlzIG5vdCBuZWVk
ZWQsIFFlbXUgc2hvdWxkIGJlIGFibGUgdG8gYm9vdCBkaXJlY3RseSBpbnRvIHRoZQo+IHVuY29t
cHJlc3NlZCBMaW51eCBrZXJuZWwgYmluYXJ5IHdpdGhvdXQgdGhlIG5lZWQgdG8gcnVuIGZpcm13
YXJlLgo+IAo+IFRoZXJlIGFscmVhZHkgZXhpc3RzIGFuIEFCSSB0byBhbGxvdyB0aGlzIGZvciBY
ZW4gUFZIIGd1ZXN0cyBhbmQgdGhlIEFCSQo+IGlzIHN1cHBvcnRlZCBieSBMaW51eCBhbmQgRnJl
ZUJTRDoKPiAKPiAgICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21pc2Mv
cHZoLmh0bWwKPiAKPiBUaGlzIHBhdGNoIHNlcmllcyB3b3VsZCBlbmFibGUgUWVtdSB0byB1c2Ug
dGhhdCBzYW1lIGVudHJ5IHBvaW50IGZvcgo+IGJvb3RpbmcgS1ZNIGd1ZXN0cy4KCkhvdyB3b3Vs
ZCBJIGRvIHRoYXQsIHByYWN0aWNhbGx5PwoKTG9va2luZyBhdCB0aG9zZSBoZXJlOgoKPiAgKiBR
ZW11IGFuZCBxYm9vdCBSRkMgcGF0Y2hlcyBoYXZlIGJlZW4gcG9zdGVkIHRvIHNob3cgb25lIGV4
YW1wbGUgb2YgaG93Cj4gICAgdGhpcyBmdW5jdGlvbmFsaXR5IGNhbiBiZSB1c2VkLiBTb21lIHBy
ZWxpbWluYXJ5IG51bWJlcnMgYXJlIGF2YWlsYWJsZQo+ICAgIGluIHRob3NlIGNvdmVyIGxldHRl
cnMgc2hvd2luZyB0aGUgS1ZNIGd1ZXN0IGJvb3QgdGltZSBpbXByb3ZlbWVudC4KPiAgICAgICBR
ZW11Ogo+ICAgICAgIGh0dHA6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRl
dmVsLzIwMTgtMTIvbXNnMDA5NTcuaHRtbAo+ICAgICAgIHFib290Ogo+ICAgICAgIGh0dHA6Ly9s
aXN0cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMTgtMTIvbXNnMDA5NTMu
aHRtbAoKSSBtaWdodCBzdGlsbCBuZWVkIHRvIGRvIHNvbWUgZGFuY2luZyB0byBnZXQgc3R1ZmYg
Z29pbmcuCgpUaHguCgotLSAKUmVnYXJkcy9HcnVzcywKICAgIEJvcmlzLgoKR29vZCBtYWlsaW5n
IHByYWN0aWNlcyBmb3IgNDAwOiBhdm9pZCB0b3AtcG9zdGluZyBhbmQgdHJpbSB0aGUgcmVwbHku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
