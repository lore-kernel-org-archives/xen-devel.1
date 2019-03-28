From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH for-4.12] passthrough/vtd: Drop the
 "workaround_bios_bug" logic entirely
Date: Thu, 28 Mar 2019 15:06:03 +0000
Message-ID: <fedb615e-a66c-a99b-c5b9-b2ee3c6bbd37@citrix.com>
References: <1553199980-9849-1-git-send-email-andrew.cooper3@citrix.com>
 <5C98F2A50200007800221B22@prv1-mh.provo.novell.com>
 <5ed95c61-9ede-fd6a-3706-87cab323ac30@citrix.com>
 <5C99EC230200007800221D12@prv1-mh.provo.novell.com>
 <3ad4fc12-e999-3cb5-e560-bb7993d82208@citrix.com>
 <5C9A2BAF0200007800221EDA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C9A2BAF0200007800221EDA@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Lars Kurth <lars.kurth@xenproject.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8yNi8xOSAxOjM5IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhpcyBpcyBhIHJlZ3Jl
c3Npb24gaW4gNC4xMiBhbmQgbmVlZHMgcmVzb2x2aW5nLiAgVGhlIGNob2ljZSBpcyBiZXR3ZWVu
Cj4+IHJldmVydGluZyBkY2Y0MTc5MCBvciByZW1vdmluZyB0aGlzIGNvZGUsIGFuZCByZXZlcnRp
bmcgZGNmNDE3OTAgaXMKPj4gb2J2aW91c2x5IG5vdCBhIHZhbGlkIHRoaW5nIHRvIGRvLgo+IAo+
IEFzIGV4cGxhaW5lZCBiZWZvcmUsIHRoZXJlIHdhcyBhbiBlYXJsaWVyIHJlZ3Jlc3Npb24sIHdo
aWNoIC0gaWYgaXQKPiBoYWQgYmVlbiBub3RpY2VkIGluIHRpbWUgLSB3b3VsZCBoYXZlIG1hZGUg
YWxsIHZlcnNpb25zIGZyb20gNC4yCj4gdG8gNC4xMSBiZWhhdmUgbGlrZSA0LjEyIHdpdGhvdXQg
eW91ciBjaGFuZ2UuIFRoaXMgYmVoYXZpb3Igd2FzCj4gaW50ZW5kZWQgYnkgdGhlIG9yaWdpbmFs
IGF1dGhvci4gUmlwcGluZyB0aGUgY29kZSBvdXQgYnkgY29udmluY2luZwo+IHBlb3BsZSB0byBi
eXBhc3Mgbm9ybWFsIHJldmlldyBmbG93IGlzLCB3ZWxsLCBub3QgdmVyeSBuaWNlIHRvIHB1dCBp
dAo+IG1pbGRseS4KCkkgd291bGQgbGlrZSB0byBzYXksIEkgdGhvdWdodCBBbmR5IHRyaWVkIHRv
IGJlIHZlcnkgc2NydXB1bG91cyBoZXJlLgpIZSBoYWQgdHdvIGRpZmZlcmVudCBSLWIncyBmcm9t
IHBlb3BsZSBmYW1pbGlhciB3aXRoIHRoZSBjb2RlLCBhbmQgYW4KQWNrIGZyb20gdGhlIHJlbGVh
c2UgY29vcmRpbmF0b3IuIEkgdGhpbmsgaGUgd291bGQgaGF2ZSBiZWVuIGp1c3RpZmllZAppbiBj
aGVja2luZyB0aGUgcGF0Y2ggaW4gb24gdGhhdCBiYXNpcywgYnV0IGp1c3QgdG8gbWFrZSBzdXJl
IGhlIHdhcwpkb2luZyB0aGUgcmlnaHQgdGhpbmcsIGhlIGFza2VkIHNvbWVvbmUgZWxzZSBmcm9t
ICJUaGUgUmVzdCIgKG1lKSB0bwpkb3VibGUtY2hlY2sgdG8gbWFrZSBzdXJlLgoKR2l2ZW4gdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiBob3cgdGhlIHR3byBvZiB5b3UgYXBwcm9hY2ggdGhpcyBzb3J0
IG9mCnRoaW5nLCBJIHVuZGVyc3RhbmQgd2h5IHlvdSBtaWdodCBpbnRlcnByZXQgdGhhdCBpbiBh
IG5lZ2F0aXZlIGxpZ2h0LgpCdXQgSSBkb24ndCB0aGluayBpdCdzIGluIHRoZSBiZXN0IGludGVy
ZXN0IG9mIHRoZSBwcm9qZWN0IGZvciBwZW9wbGUgdG8KYmUgY29tcGxldGVseSByaXNrLWF2ZXJz
ZSBpbiB0aGlzIHNvcnQgb2Ygc2l0dWF0aW9uLiAgV2UgaGF2ZSBzb3VyY2UKY29udHJvbCBmb3Ig
YSByZWFzb246IElmIHRoZSBjaGFuZ2UgdHVybnMgb3V0IHRvIGhhdmUgYmVlbiB3cm9uZywgd2Ug
Y2FuCnJldmVydCBpdC4KCiAtR2VvcmdlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
