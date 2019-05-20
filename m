From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 1/2] xen/device-tree: Add
 dt_count_phandle_with_args helper
Date: Mon, 20 May 2019 15:37:18 +0100
Message-ID: <52bcc51d-7572-af0d-5928-07717419b05a@arm.com>
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1556806436-26283-2-git-send-email-olekstysh@gmail.com>
 <ce325872-a19e-2d07-ca88-cd3f0b1bd933@arm.com>
 <6534c5d0-1164-4076-f22f-6a820eff9c46@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSjPl-00081h-VP
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:37:22 +0000
In-Reply-To: <6534c5d0-1164-4076-f22f-6a820eff9c46@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMC8wNS8yMDE5IDE0OjQ4LCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gT24gMjAuMDUuMTkg
MTQ6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4gCj4gSGksIEp1bGllbgo+IAo+IAo+
Pgo+PiBPbiAwMi8wNS8yMDE5IDE1OjEzLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4+
IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4KPj4+Cj4+PiBQb3J0IExpbnV4IGhlbHBlciBvZl9jb3VudF9waGFuZGxlX3dpdGhfYXJncyBm
b3IgY291bnRpbmcKPj4+IG51bWJlciBvZiBwaGFuZGxlcyBpbiBhIHByb3BlcnR5Lgo+Pgo+PiBM
aW51eCA1LjEgdXNlcyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uIGZvciAK
Pj4gb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MuIFNvIHdoaWNoIHZlcnNpb24gb2YgTGludXgg
ZGlkIHlvdSBwb3J0IGZyb20/Cj4gCj4gVGhpcyBwYXRjaCBpcyBleGFjdGx5IHRoZSBzYW1lIG9u
ZSBbMV0sIEkgZGlkIG1vcmUgdGhhbiAyIHllYXJzIGFnbyBpbiB0aGUgCj4gY29udGV4dCBvZiBu
b24tc2hhcmVkIElPTU1VIHBhdGNoIHNlcmllcy4gTGlrZWx5LCBJIHdhcyBiYXNlZCBvbiB2NC40
Lgo+IAo+IFNvcnJ5IGZvciB0aGUgY29uZnVzaW5nIGRlc2NyaXB0aW9uLgo+IAo+IAo+IFlvdSBh
cmUgcmlnaHQsIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2ZfY291bnRfcGhhbmRsZV93aXRoX2Fy
Z3MgaXMgY29tcGxldGVseSAKPiBkaWZmZXJlbnQsIGFuZCBJIGFtIGFmcmFpZCwgaXMgbm90IGVh
c2lseSBiYWNrLXBvcnRhYmxlIHRvIFhlbi4KPiAKPiBJZiB0aGUgaW1wbGVtZW50YXRpb24gInY0
LjQiIGxvb2tzIGNvcnJlY3QgYW5kIGZpdHMgaW4gY3VycmVudCBYZW4gY29kZWJhc2UsIEkgCj4g
Y2FuIHJlY29sbGVjdCBhbiBleGFjdCB2ZXJzaW9uIGFuZCB1cGRhdGUgdGhlIHBhdGNoIGRlc2Ny
aXB0aW9uLgo+IAo+IFdoYXQgZG8geW91IHRoaW5rPwoKVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24gbG9va3MgY29ycmVjdC4gU28gdGhlIGNvbW1pdCBtZXNzYWdlIG5lZWRzIHRvIGJlIHVwZGF0
ZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
