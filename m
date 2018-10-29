From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] arch/x86: Add registers to vm_event
Date: Mon, 29 Oct 2018 10:43:42 -0600
Message-ID: <5BD738BE02000078001F5EF1@prv1-mh.provo.novell.com>
References: <20181026091135.22780-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHAdo-0001Q9-9u
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 16:43:48 +0000
In-Reply-To: <20181026091135.22780-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjEwLjE4IGF0IDExOjExLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC0xNTcsNiArMTU3LDIxIEBACj4gICNkZWZpbmUgVk1fRVZFTlRfWDg2X0NSNCAgICAy
Cj4gICNkZWZpbmUgVk1fRVZFTlRfWDg2X1hDUjAgICAzCj4gIAo+ICsvKgo+ICsgKiBUaGUgbGlt
aXQgZmllbGQgaXMgcmlnaHQtc2hpZnRlZCBieSAxMiBiaXRzIGlmIC5hci5nIGlzIHNldC4KPiAr
ICovCgpUaGlzIGlzIHN1cHBvc2VkIHRvIGJlIGEgc2luZ2xlIGxpbmUgY29tbWVudC4KCj4gQEAg
LTE5MSw5ICsyMDYsMTkgQEAgc3RydWN0IHZtX2V2ZW50X3JlZ3NfeDg2IHsKPiAgICAgIHVpbnQ2
NF90IG1zcl9lZmVyOwo+ICAgICAgdWludDY0X3QgbXNyX3N0YXI7Cj4gICAgICB1aW50NjRfdCBt
c3JfbHN0YXI7Cj4gLSAgICB1aW50NjRfdCBmc19iYXNlOwo+IC0gICAgdWludDY0X3QgZ3NfYmFz
ZTsKPiAtICAgIHVpbnQzMl90IGNzX2FyYnl0ZXM7Cj4gKyAgICBzdHJ1Y3QgeDg2X3NlbGVjdG9y
X3JlZ18zMiBjczsKPiArICAgIHN0cnVjdCB4ODZfc2VsZWN0b3JfcmVnXzMyIHNzOwo+ICsgICAg
c3RydWN0IHg4Nl9zZWxlY3Rvcl9yZWdfMzIgZHM7Cj4gKyAgICBzdHJ1Y3QgeDg2X3NlbGVjdG9y
X3JlZ18zMiBlczsKPiArICAgIHN0cnVjdCB4ODZfc2VsZWN0b3JfcmVnXzY0IGZzOwoKU2luY2Ug
eW91IHNheSBzcGFjZSBpcyBzY2FyY2Ugb24gdGhlIHJpbmcsIHlvdSBtYXkgd2FudCB0byBjb25z
aWRlcgpmaWxsaW5nIHRoZSAoSSB0aGluaykgNC1ieXRlIGdhcHMgaGVyZSBhbmQgLi4uCgo+ICsg
ICAgc3RydWN0IHg4Nl9zZWxlY3Rvcl9yZWdfNjQgZ3M7CgouLi4gaGVyZSwgZS5nLiBieSBwdXR0
aW5nIHR3byBzZWxlY3RvciB2YWx1ZXMgdGhlcmUuIEJ1dCBvZiBjb3Vyc2UKdGhpcyByZXF1aXJl
cyBlaXRoZXIgc3BsaXR0aW5nIHN0cnVjdCB4ODZfc2VsZWN0b3JfcmVnX3szMiw2NH0gb3IKc29t
ZWhvdyAoaW4gYSBnY2MgZXh0ZW5zaW9uIGZyZWUgd2F5KSByZWR1Y2luZyB0aGUgYWxpZ25tZW50
IG9mCnRoZSBsYXR0ZXIuIE15IHJlY29tbWVuZGF0aW9uIHdvdWxkIGJlIHRvIHBhY2sgb25seSBs
aW1pdCBhbmQKYWNjZXNzIHJpZ2h0cyBpbnRvIGEgc3RydWN0dXJlLCBhbmQgcHJvdmlkZWQgYmFz
ZXMgYXMgc3RhbmRhbG9uZQpmaWVsZHMganVzdCBsaWtlIHlvdSBhbHJlYWR5IGRvIGZvciBzZWxl
Y3RvcnMuIFdpdGggdGhhdCB5b3UnZCB0aGVuCmFsc28gbm90IG5lZWQgdG8gcHV0IHNvbWUgb2Yg
dGhlIHNlbGVjdG9yIHZhbHVlcyBpbiB0aGUgbWlkZGxlICh0bwpmaWxsIHBhZGRpbmcgaG9sZXMp
LgoKQnV0IHRoaXMgaXMganVzdCBhIHN1Z2dlc3Rpb24gLSBJJ20gbm90IHRoZSBtYWludGFpbmVy
IG9mIGFueSBvZiB0aGUKY29kZSB5b3UgY2hhbmdlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
