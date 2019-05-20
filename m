From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH] x86/svm: Drop support for AMD's Lightweight
 Profiling
Date: Mon, 20 May 2019 18:43:10 +0000
Message-ID: <20190520184306.GC23047@amd.com>
References: <1558347216-19179-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Q6f=TU=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hSnFk-0007fr-Lm
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 18:43:16 +0000
In-Reply-To: <1558347216-19179-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <E8ED69DEAAFB0C4ABFA410918182B81F@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6MTM6MzZBTSArMDEwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gTGlnaHR3ZWlnaHQgUHJvZmlsaW5nIHdhcyBpbnRyb2R1Y2VkIGluIEJ1bGxkb3plciAo
RmFtMTVoKSwgYnV0IHdhcyBkcm9wcGVkCj4gZnJvbSBaZW4gKEZhbTE3aCkgcHJvY2Vzc29ycy4g
IEZ1cnRoZXJtb3JlLCBMV1Agd2FzIGRyb3BwZWQgZnJvbSBGYW0xNS8xNiBDUFVzCj4gd2hlbiBJ
QlBCIGZvciBTcGVjdHJlIHYyIHdhcyBpbnRyb2R1Y2VkIGluIG1pY3JvY29kZSwgb3dpbmcgdG8g
TFdQIG5vdCBiZWluZwo+IHVzZWQgaW4gcHJhY3RpY2UuCj4gCj4gQXMgYSByZXN1bHQsIENQVXMg
d2hpY2ggYXJlIG9wZXJhdGluZyB3aXRoaW4gc3BlY2lmaWNhdGlvbiAoaS5lLiB3aXRoIHVwIHRv
Cj4gZGF0ZSBtaWNyb2NvZGUpIG5vIGxvbmdlciBoYXZlIHRoaXMgZmVhdHVyZSwgYW5kIHRoZXJl
Zm9yZSBhcmUgbm90IHVzaW5nIGl0Lgo+IAo+IERyb3Agc3VwcG9ydCBmcm9tIFhlbi4gIFRoZSBt
YWluIG1vdGl2YXRpb24gaGVyZSBpcyB0byByZW1vdmUgdW5uZWNlc3NhcnkKPiBjb21wbGV4aXR5
IGZyb20gQ1BVSUQgaGFuZGxpbmcsIGJ1dCBpdCBhbHNvIHRpZGllcyB1cCB0aGUgU1ZNIGNvZGUg
bmljZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4K
CkkndmUgY29uZmlybWVkIHdpdGggSFcgZW5naW5lZXJzIHRoYXQgaXQncyBnb2luZyBhd2F5LgoK
LS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
