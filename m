From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/7] xen/arm: vsmc: Implement SMCCC 1.1
Date: Tue, 6 Feb 2018 18:04:03 +0000
Message-ID: <7773c5fe-8f76-6317-11c5-b1148af46ea8@arm.com>
References: <20180205132011.27996-1-julien.grall@arm.com>
 <20180205132011.27996-5-julien.grall@arm.com>
 <CAOcqxo1652sS36KGnUiNX2Haj9AJSxKz_-19byDwhgBAgWHLAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAOcqxo1652sS36KGnUiNX2Haj9AJSxKz_-19byDwhgBAgWHLAQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMi8wNi8yMDE4IDA0OjE4IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBP
biA1IEZlYnJ1YXJ5IDIwMTggYXQgMTU6MjAsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+IHdyb3RlOgo+PiBUaGUgbmV3IFNNQyBDYWxsaW5nIENvbnZlbnRpb24gKHYxLjEpIGFs
bG93cyBmb3IgYSByZWR1Y2VkIG92ZXJoZWFkIHdoZW4KPj4gY2FsbGluZyBpbnRvIHRoZSBmaXJt
d2FyZSwgYW5kIHByb3ZpZGVzIGEgbmV3IGZlYXR1cmUgZGlzY292ZXJ5Cj4+IG1lY2hhbmlzbS4g
U2VlIEFSTSBERU4gMDAwNzBBLgo+INChb3VsZCB5b3UgcGxlYXNlIHVzZSBhbHNvIGEgaHVtYW4t
cmVhZGFibGUgZG9jdW1lbnQgbmFtZT8gSSByZW1lbWJlcgo+IHRoYXQgSSByZWFkICJGaXJtd2Fy
ZSBpbnRlcmZhY2VzIGZvciBtaXRpZ2F0aW5nIENWRS0yMDE3LTU3MTUiLCBidXQgSQo+IGNhbid0
IHJlbWVtYmVyIHdoYXQgaXMgQVJNIERFTiAwMDA3MEEgYWJvdXQuCgpUaGUgcmVhc29uIEkgYW0g
dXNpbmcgQVJNIERFTiAwMDcwQSBpcyBiZWNhdXNlIHRoZSBuYW1lIGRvZXMgbm90IGdpdmUgCnlv
dSByZXZpc2lvbiBvZiB0aGUgc3BlY2lmaWNhdGlvbi4gU28geW91IGNhbid0IGtub3cgd2hldGhl
ciB5b3UgdXNlIHJldiAKQSBvciBCLiBBcyBuZXcgcmV2aXNpb24gbWF5IGludHJvZHVjZS9jaGFu
Z2UgYmVoYXZpb3IsIHRoaXMgaXMgdmVyeSAKaGVscGZ1bCB0byBrbm93IHdoaWNoIHNwZWNpZmlj
IHJldmlzaW9uIHRoYXQgd2FzIHVzZWQgdG8gd3JpdGUgdGhlIGNvZGUuCgpJdCBpcyBhbHNvIG11
Y2ggZWFzaWVyIHRvIGZpbmQgb24gdGhlIHdlYiB0aGUgaWRlbnRpZmllciB0aGFuIHRoZSB0aXRs
ZSAKYXMgeW91IGRpcmVjdGx5IHJlYWNoIHRvIGEgZ2l2ZW4gdmVyc2lvbgoKQW55d2F5LCBJIGNh
biBtZW50aW9uIHRoZSBmdWxsIG5hbWUgb2YgdGhlIHNwZWNpZmljYXRpb24gaW4gdGhlIGNvbW1p
dC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
