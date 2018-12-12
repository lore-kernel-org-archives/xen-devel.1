From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 12 Dec 2018 15:08:27 +0000
Message-ID: <e381b039-67fe-0d56-4163-b8d5605690b8@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
 <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
 <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
 <17e191b5-7252-c1d7-1f0f-39f98fdb9895@arm.com>
 <934f091c-234c-9bd6-52bc-2e78f9de4e17@gmail.com>
 <74fb1410-5ba6-2da8-2be3-6de3bd89af38@arm.com>
 <6d82b734-acbf-a089-858e-9fa0475ac127@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX67j-0000ng-4f
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 15:08:31 +0000
In-Reply-To: <6d82b734-acbf-a089-858e-9fa0475ac127@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8xMi8yMDE4IDE0OjU4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDEy
LjEyLjE4IDE2OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFTU0VSVCBvbmx5IHRlbGxzIHlv
dSB0aGF0IGRlc2MtPmFjdGlvbiB3YXMgTlVMTC4gSXQgZG9lcyBub3QgdGVsbCB5b3Ugd2hpY2gg
Cj4+IElSUSBoYXMgdGhlIGRlc2MtPmFjdGlvbiA9PSBOVUxMLgo+IEFoLCB5ZXMuCj4gCj4+IEl0
IGlzIGEgYml0IGEgc2hhbWUgd2UgZG9uJ3QgaGF2ZSB3YXkgdG8gcHJvdmlkZSBhbm90aGVyIG1l
c3NhZ2Ugd2l0aCBBU1NFUlQgCj4+IHRvIGhlbHAgeW91IGRlYnVnZ2luZy4KPiBXZSBtaWdodCBo
YXZlIGltcGxlbWVudGVkIGFuIGFzc2VydCB3aXRoIGEgbWVzc2FnZS4KPiBBbmQgZ3V5cyBvbiBz
dGFja292ZXJmbG93IHN1Z2dlc3QgZm9yIHdvcmthcm91bmQgYEFTU0VSVChjb25kaXRpb24gJiYg
ImVycm9yIAo+IG1lc3NhZ2UiKWAuCgpUaGF0J3Mgbm90IGdvaW5nIHRvIGhlbHAgZm9yIHNob3dp
bmcgdGhlIElSUSBudW1iZXIuCgo+IAo+PiBObywgSSBhbSBzdWdnZXN0aW5nIHRvIGhhdmUgdGhl
IGN1cnJlbnQgaWYgKCB0ZXN0X2JpdCguLi4pICkgcHJvdGVjcmVkIHdpdGggCj4+ICNpZm5kZWYg
TkRFQlVHLiBObyBjb2RlIGR1cGxpY2F0aW9uLgo+IEkgd291bGQgbm90IGxpa2UgdG8gbGVhdmUg
ZXZlbiBub24tZGVidWcgYnVpbGQgd2l0aG91dCB0aGUgY2hlY2suCgpUaGUgY2hlY2sgaXMgbWFp
bmx5IHRoZXJlIHRvIGNhdGNoIGVycm9yIGluIGRlYnVnIGJ1aWxkLiBTbyBJIGFtIHF1aXRlIGNv
bmZ1c2VkIAp3aGF0IGlzIHlvdXIgZ29hbCBieSBtb3ZpbmcgdGhlIGNoZWNrLiBJcyBpdCBqdXN0
IGJlY2F1c2UgaXQgYWRkcyBhIGNvdXBsZSBtb3JlIAppbnN0cnVjdGlvbiBpbiB0aGUgZ3Vlc3Qg
Y2FzZT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
