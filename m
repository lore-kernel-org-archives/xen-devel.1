From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Tue, 18 Dec 2018 10:47:43 +0200
Message-ID: <e8c0ae01-a75d-ac08-b7d9-9ef4e1abd641__47248.3190046207$1545122800$gmane$org@gmail.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-2-andr2000@gmail.com>
 <3c69d924-11e1-7037-bfa5-276d22b245fe@gmail.com>
 <27491aa5-3548-4c39-13a2-132c738fae14@gmail.com>
 <71920419-f0ef-8489-35ff-ff8375cb7361@gmail.com>
 <ce52ec2e-1b22-8a2f-7f99-d90fcfdbfebd@oracle.com>
 <686a8b1e-3588-32bc-abc7-79221dc9c74e@gmail.com>
 <19501fdd-eae6-295e-7394-777c25ea4cf1@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3HKb=O3=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gZB2c-000079-01
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 08:47:50 +0000
Received: by mail-lf1-x141.google.com with SMTP id n18so11615448lfh.6
 for <xen-devel@lists.xenproject.org>; Tue, 18 Dec 2018 00:47:48 -0800 (PST)
In-Reply-To: <19501fdd-eae6-295e-7394-777c25ea4cf1@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTcvMTggNToyNiBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEyLzE3LzE4
IDEwOjAzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4gT24gMTIvMTcvMTgg
NDo1MiBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gMTIvMTcvMTggNToxOSBBTSwg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+Pj4gSGVsbG8sIEp1ZXJnZW4sIEJvcmlz
IQo+Pj4+Cj4+Pj4gQXMgdGhpcyBEUk0gcGFydCBvZiB0aGUgc2VyaWVzIGlzIHRoZSBvbmx5IG9u
ZSB3aGljaCBuZWVkcyBhY2svbmFjawo+Pj4+Cj4+Pj4gKGFuZCBpdCBtaWdodCB0YWtlIHF1aXRl
IHNvbWUgdGltZSB0byBjb21wbGV0ZSkgY291bGQgd2UgcGxlYXNlCj4+Pj4KPj4+PiBtZXJnZSB0
aGUgcGF0Y2hlcyAxIGFuZCAzIG5vdyB0aGF0IGFscmVhZHkgaGF2ZSBhY2svci1iPwo+Pj4+Cj4+
Pgo+Pj4gVEJIIEkgYW0gbm90IHN1cmUgaXQgbWFrZXMgc2Vuc2UgdG8gZG8gdGhpcyB3aXRob3V0
IHRoZSBzZWNvbmQgcGF0Y2guCj4+PiBSZWZhY3RvcmluZyAoYW5kIElJVUlDIHRoaXMgc2VyaWVz
IGlzIHB1cmVseSByZWZhY3RvcmluZyAtLS0gaXMgaXQgbm90PykKPj4+IGlzIGRvbmUgdG8gcmVk
dWNlIGFtb3VudCBvZiBjb2RlLCBhbmQgd2l0aCBvbmx5IGZpcnN0IGFuZCB0aGlyZCBwYXRjaCB3
ZQo+Pj4gZW5kIHVwIHdpdGggcXVpdGUgYSBzaWduaWZpY2FudCBpbmNyZWFzZSBpbiB0aGUgbnVt
YmVyIG9mIExvQy4gKEkgYW0KPj4+IGdvaW5nIHB1cmVseSBieSBkaWZmc3RhdCkKPj4+Cj4+PiBP
ZiBjb3Vyc2UsIHRoZSBvdGhlciByZWFzb24gZm9yIHJlZmFjdG9yaW5nIGlzIHRvIGVsaW1pbmF0
ZSBjb2RlCj4+PiBkdXBsaWNhdGlvbiwgYnV0IHdpdGhvdXQgc2Vjb25kIHBhdGNoIHRoYXQgd2ls
bCBub3QgaGFwcGVuLgo+PiBBZ3JlZSwgYnV0IHRoaXMgaXMgdGhlIGJhc2lzIGZvciB0aGUgbmV3
IHB2IGNhbWVyYSBmcm9udGVuZAo+Pgo+PiBJIGFtIHdvcmtpbmcgb24gbm93IFsxXSwgc28gZXZl
biBpZiB3ZSBkbyBub3QgcmVtb3ZlIHRoZSBjb2RlIGZyb20gRFJNCj4+Cj4+IHRoZW4gd2UgYXQg
bGVhc3QgZG8gbm90IGFkZCBpdCB0byB0aGUgY2FtZXJhIGRyaXZlcgo+Cj4gU2luY2UgMSBhbmQg
MyBhcmUgYWxyZWFkeSBBQ0tlZCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gc3RhcnQgdGhlIGNhbWVy
YQo+IHNlcmllcyB3aXRoIHRoZXNlIHR3byBwYXRjaGVzIGFzIHByZS1yZXF1aXNpdGVzIGV2ZW4g
aWYgcGF0Y2ggMiBpcyBzdGlsbAo+IHN0YWxsZWQgYnkgdGhlIHRpbWUgeW91ciBjYW1lcmEgY29k
ZSBpcyBwb3N0ZWQgKHdoaWNoIEkgYXNzdW1lIHdpbGwgYmUKPiA0LjIyIG9yIGxhdGVyKS4KQWdy
ZWVkLCBtYXliZSBieSB0aGF0IHRpbWUgRFJNIHBhcnQgd2lsbCBhbHNvIGdldCBpdHMgci1iL2Fj
awo+Cj4KPiAtYm9yaXMKPgo+Cj4+PiAtYm9yaXMKPj4gVGhhbmsgeW91LAo+Pgo+PiBPbGVrc2Fu
ZHIKPj4KPj4gWzFdCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbmRyMjAwMC9saW51eC9ibG9iL2Nh
bWVyYV9mcm9udF92MS9kcml2ZXJzL21lZGlhL3hlbi9LY29uZmlnI0w2Cj4+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
