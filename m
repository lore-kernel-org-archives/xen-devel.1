From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] cpupool: fix ASSERT( c != old_pool )
Date: Mon, 8 Apr 2019 12:25:06 +0200
Message-ID: <11f0f156-4313-00c4-0355-0fdb82db70cb@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hDRSh-0005Qi-FB
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:25:11 +0000
References: =?UTF-8?B?PDE1NTQ2OTEyNDbvv703MjQ577+9Me+/vWdpdO+/vXNlbmTvv71l?=
 =?UTF-8?B?bWFpbO+/vWZpb25hbGnvv71vY0B6aGFveGluLmNvbT4gPDMxOTgzNzg4LWU0ZTQt?=
 =?UTF-8?Q?5526-04a1-660c00930d0d=40suse=2ecom=3e_=3c5CAB13DA02000078002253F?=
 =?UTF-8?B?N0BzdXNlLmNvbT4=?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, "FionaLi-oc <fionali-oc@zhaoxin.com>" <fionali-oc@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDQvMjAxOSAxMToyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDQuMTkg
YXQgMDc6MDksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwOC8wNC8yMDE5IDA0OjQw
LCBGaW9uYUxpLW9jIHdyb3RlOgo+Pj4gQXNzaWduaW5nIGNwdSB0byBjcHVwb29sIG5lZWRuJ3Qg
dG8gc3dpdGNoIGNwdSBzY2hlZHVsZXIgd2hlbgo+Pj4gc3lzdGVtIHN0YXRlIGlzIHJlc3VtZSwg
b3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgQVNTRVJUIGluCj4+PiBzY2hlZHVsZV9jcHVfc3dpdGNo
KCkuCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBpcyBuZWVkZWQgb24gY3VycmVudCBz
dGFnaW5nIHRyZWUuIENvbW1pdAo+PiA2ODcwZWE5ZDFmYWQ2ZmJlMjcgY2hhbmdlZCByZXN1bWUg
aGFuZGxpbmcgbGVhZGluZyB0bwo+PiBjcHVwb29sX2Fzc2lnbl9jcHVfbG9ja2VkKCkgYmVpbmcg
bm8gbG9uZ2VyIGNhbGxlZCB3aGVuIHJlc3VtaW5nLgo+IAo+IEJ1dCBpcyBpdCBzb21ldGhpbmcg
d29ydGh3aGlsZSB0byBwdXQgb250byBzdGFibGUgdHJlZXMgKHdpdGggdGhlCj4gb25lIG1pc3Np
bmcgYmxhbmsgYWRkZWQpPwoKSSBkb24ndCB0aGluayBpdCBpcyBhbHdheXMgY29ycmVjdC4KCldo
aWxlIGF2b2lkaW5nIHRoZSBBU1NFUlQoKSB0cmlnZ2VyaW5nIGl0IHdvbid0IHN3aXRjaCBiYWNr
IHRoZQpzY2hlZHVsZXIgZnJvbSB0aGUgZGVmYXVsdCBvbmUgYXQgcmVzdW1lLCB3aGljaCB3YXMg
YWN0aXZhdGVkIHdoZW4Kc3VzcGVuZGluZyB0aGUgbWFjaGluZS4KClNvIGZvciBvbGRlciBYZW4g
dmVyc2lvbnMgd2UnZCBuZWVkIHRvIGtub3cgd2hpY2ggQVNTRVJUKCkgd2FzCnRyaWdnZXJpbmcg
YW5kIHdoeSB0aGF0IGRpZCBoYXBwZW4sIG9yIHdlIGNvdWxkIGJhY2twb3J0IG15IHNlcmllcwpy
ZW1vdmluZyByZWFsbHkgdGhlIG5lZWQgZm9yIGNhbGxpbmcgc2NoZWR1bGVfY3B1X3N3aXRjaCgp
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
