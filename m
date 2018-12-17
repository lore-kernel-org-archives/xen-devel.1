From: Wei Wang <wei.w.wang@intel.com>
Subject: Re: intel_pstate driver patches by Wei Wang from 2015
Date: Mon, 17 Dec 2018 16:42:40 +0800
Message-ID: <5C176180.3090200@intel.com>
References: <20181214141654.GF989@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C9MF=O2=intel.com=wei.w.wang@srs-us1.protection.inumbo.net>)
 id 1gYoP3-0002WK-Sw
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 08:37:29 +0000
In-Reply-To: <20181214141654.GF989@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTQvMjAxOCAxMDoxNiBQTSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3Rl
Ogo+IEhpLAo+Cj4gSSB3b25kZXIgd2hhdCBoYXBwZW5lZCB0byBpbnRlbF9wc3RhdGUgcGF0Y2gg
c2VyaWVzWzFdIGJhY2sgaW4gMjAxNT8KPiBJJ3ZlIHNlZW4gdGhlcmUgd2FzIHNvbWUgcmV2aWV3
IGZlZWRiYWNrWzJdWzNdWzRdWzVdWzZdWzddIG9uIHY2LAo+IHBhdGNoZXMgNC82IGFuZCA2LzYg
d2VyZSBhY2tlZC4gV2VyZSB0aGUgcmV2aWV3IGNvbW1lbnRzIGV2ZXIgYWRkcmVzc2VkCj4gKGNh
bid0IGZpbmQgaXQpPyAgT3IgbWF5YmUgdGhlcmUgaXMgc29tZSBvdGhlciBtZWNoYW5pc20gaW4g
cGxhY2UgZm9yIHByb3Blcgo+IHBvd2VyIG1hbmFnZW1lbnQgb24gcmVjZW50IEludGVsIENQVXM/
IEFwcGFyZW50bHkgYWNwaS1jcHVmcmVxIGRyaXZlcgo+IG5vdCBhbHdheXMgZG9lcyBpdHMgam9i
IHdlbGxbOF0uCj4KPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9o
dG1sL3hlbi1kZXZlbC8yMDE1LTEwL21zZzAzMDQ4Lmh0bWwKPiBbMl0gaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE1LTExL21zZzAyMDQzLmh0
bWwKPiBbM10gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE1LTExL21zZzAyNDEwLmh0bWwKPiBbNF0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE1LTExL21zZzAyNDMwLmh0bWwKPiBbNV0g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE1
LTExL21zZzAyNDQzLmh0bWwKPiBbNl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE1LTExL21zZzAyNDU2Lmh0bWwKPiBbN10gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE1LTEwL21zZzAz
MDg2Lmh0bWwKPiBbOF0gaHR0cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtaXNzdWVzL2lz
c3Vlcy80NjA0I2lzc3VlY29tbWVudC00NDY4MTY1MzYKPgoKSGkgTWFyZWssCgpJdCB3YXMgcGF1
c2VkIGJlY2F1c2UgdGhlcmUgd2FzIG5vIHVzZXJzIGluIHRoZSBjbG91ZHMgLSBwZW9wbGUgdXN1
YWxseSAKaGF2ZSBQLXN0YXRlIGRpc2FibGVkLgoKQmVzdCwKV2VpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
