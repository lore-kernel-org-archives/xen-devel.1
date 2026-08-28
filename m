Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D81C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 10:20:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401880.1637367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wztgO-0003q4-Ln; Fri, 28 Aug 2026 10:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401880.1637367; Fri, 28 Aug 2026 10:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wztgO-0003px-Is; Fri, 28 Aug 2026 10:19:36 +0000
Received: by outflank-mailman (input) for mailman id 1401880;
 Fri, 28 Aug 2026 10:19:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wztgO-0003pr-1o
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:19:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wztgM-0070rC-NW
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 12:19:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a9160ad-e002-0a2a0a5209dd-0a2a4506d0c0-22
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 12:19:34 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a9160b4-195a-0a2a45060019-cddca883b838-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 12:19:34 +0200
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SA7jXK3306358
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:19:32 GMT
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p94fh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:19:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52fb8f67601so10054211cf.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 03:19:31 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b94dc1076sm39706795e9.3.2026.08.28.03.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 03:19:29 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Content-Language:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLeDyIe24xlxelqivhxFI+C08k7EOIn3h4F7ph1yYvc=; b=bWXYocUR7lIQ3ijM
	MkRbBFMz9EUllcmW4xu06IRmgdGKC5WPDsG74Yfsle7hshzSrGIbru6eG/c2bdOa
	k7GiR59KOF19ty/CgkFYqcjtViq7c80KU1mptISveF51cvHLmMyj37kmwu41TcdB
	0bcvMj11qfFQIWNt5vCUpxmsLC+vZ4ZrQKPxq5ZGy74RtJ9NN/0t7nmwVZSyooXn
	Xsnt+m3X69kkVPuxQtlxJ+tyVcVWaNZEZhZdsfIX/kItHCav395xbk9sH+yJ43Bu
	sHZgvy+EPERUNxJ9XrVgIuFQ3fdHHSxuovxrDAoe4kvrflA5BOB6W0fwi3uc40ja
	scE5yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912371; x=1788517171; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLeDyIe24xlxelqivhxFI+C08k7EOIn3h4F7ph1yYvc=;
        b=c/yzG8GkAXu5NFdnUXnj/kSTlGR+YbxTHZoUiVK1xgb5ZUK5Vhf6ggtBJqfr7AToTf
         8IkdoVmgQcp7/h92m96/UUQeY5lC2JHdkvwULo68UoGWkxhJctJ7YcyjUAc7RoBxY07N
         bM/nFNRPRJCkU4DvgAuMQw83ihvkxKqCsQb38Mj6EpuyoKsKe47LFVYe7Kp40joat8uf
         8ewATHEH67VhnsEIs2Ru/tqBc9WSBL1H/c9Z+46Fe3i0vU2RmY5nqVtRbl8Qb9lTJBsn
         tBSCmpyCUigLQrjmpQ/oAHpwYESgaclWlxYx0qyJVvEy+YMq/pzMbBUSMVYeGh6kc7Cx
         Ez2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912371; x=1788517171;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLeDyIe24xlxelqivhxFI+C08k7EOIn3h4F7ph1yYvc=;
        b=XiYAKMYcNRbxj/xA09ABzrZvdyh5BGvpEotshuiYUdH4zZOf18vpng2WIUjcwQHuJY
         k6B2PUC1Ff4DF2n5WM06pQAh6ry+LaNToN9/Tqqcqw2LuaOQ+4RCtViQF+HHBx6WSYa/
         PkH8agYaVdbo/geftNFD+7aWgTdBZNKWhvfgLz105ABBE6Vv/c9kYz446G8m6K745W+n
         kHg/U5q6mGWPy8rtdh/Voz5LLLkOJGSXWz8ReVBqx93v0TOMqzhY1WzFZiuouRS7jPbg
         bIxTbBBhIvD6xyuvx9CAuWyAFoPNVC2N1AmQqScg9VbWAVu1lWfw2KwItPa+YJRrj2JI
         swzA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6PJ/zwb8xsENfHblGYFGLibP9kXo+SAA1SnWieTC/AnxGBiMB7v0/lyEsoGGPvxtXh9D8pXt0UU4=@lists.xenproject.org
X-Gm-Message-State: AFuF++lWDsCp+1zxCj0agUbTb9dmgkH33KzTmPVUiVEzNA9e+48lGbxX
	X/eH35RrneHIWBCK+7kzFxp6hyAV0ieL+wuLnRr6YGaJOPSQCYgnBHZVfMLm1kl0olJzxqDflT+
	Fyq+sb9EIJREpZPPFUYXrYnGZv08hFRUv9D6/1Q7V4d230eLa2gqQoC3VQWnmyQVTQyECyw==
X-Gm-Gg: AR+sD13cqqA4AW6yaBcobr7jo3ZZQa4/R8rIyNDAb5nVcCKKggd5yLhUiAkFpEpFpEc
	yYh3QXfqgKXnOTGz9CVA2bRWIUafJBkSMchpZ9cMjsNbKW8KNb+XR7KN73oHuSFLIK4I5Z7sO2o
	52NV/zzZassHcSQA7GUmh5JAT77EngVkMmJhNpK6l7Q92dhgQLmHnXqVN7iGMi8etLXAxZwrO62
	1HvVAco2hjnhQEDU/CiGISwOHbayVco8v3cRTNnD5VB4X5QP54URjkqGW/JgQFGukfjGned0lap
	K4enEn54BDT2OzPEUcP7Xhy9eMsS0BBqi5I7cxjWeynLyyhNqtC3h+nLZpGv21NnATF1A0gEGxj
	1UlOW1dIKmFzvr0hyjPQu9CoVZlXAvySB1g==
X-Received: by 2002:ac8:5d13:0:b0:52e:2d4e:8eef with SMTP id d75a77b69052e-52fb93d6dcbmr61126741cf.4.1787912370579;
        Fri, 28 Aug 2026 03:19:30 -0700 (PDT)
X-Received: by 2002:ac8:5d13:0:b0:52e:2d4e:8eef with SMTP id d75a77b69052e-52fb93d6dcbmr61125891cf.4.1787912369979;
        Fri, 28 Aug 2026 03:19:29 -0700 (PDT)
Message-ID: <deabd371-a764-4556-8f2e-15f0e50649b2@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 36/49] monitor: tighten monitor_printf*()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        qemu-devel@nongnu.org
Cc: dave@treblig.org,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,
        zhenwei pi <zhenwei.pi@linux.dev>, Kevin Wolf <kwolf@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
        Ani Sinha <anisinha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
        Brian Cain <brian.cain@oss.qualcomm.com>,
        David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowangio@gmail.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Ilya Leoshkevich
 <iii@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Hyman Huang <infra.ai.cloud@bitdeer.com>, Peter Xu <peterx@redhat.com>,
        Fabiano Rosas <farosas@suse.de>,
        Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
        Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Weiwei Li
 <liwei1518@gmail.com>,
        Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Chao Liu <chao.liu@processmission.com>,
        Yoshinori Sato <yoshinori.sato@nifty.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
        kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
        xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
References: <20260825-qemu-no-hmp-v4-0-af60857c2fbe@redhat.com>
 <20260825-qemu-no-hmp-v4-36-af60857c2fbe@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260825-qemu-no-hmp-v4-36-af60857c2fbe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V3zke2dEH4-KwpvWaoesF2dsDzGdmpeN
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a9160b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=_7nI1AEwapyDFsg1MK8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: V3zke2dEH4-KwpvWaoesF2dsDzGdmpeN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX8fUywqXZp/ig
 sbrG9lBHbD8VszCXTPo3pu3xRcOckgkD+6VEsaoArNFGsG66EO290xnosSPfQwlW1aa5Wv4DDMW
 ah8hx7m/crCeJi9gmfHlP6WKF7xVZ3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX8Kk2uFMWOxmf
 evq19QIilGkJw5LdD4f+lZ+RMoH8yXZiAZsvYJQX3A9ar3aBXQhVxYbZEpVaW3HsBNtZqPShWOD
 guIxjQehurgdLZdcKpEqortG82c8REwscbgkpoCP+/m+D0Zgl94rh8uLoFdnQAyUCKKI78BxXkf
 RrIZuBDS6nyAoprxpL3cpDW4B6R6NIiN5S5Sc9aXwS+d2eGzz0vjQu7zf7yd4fQDMTU95OOh8dc
 jeZnuYqZueyMLLnWqw5uHtH6YR0GR5+KRU4+AbADgwznUP7Wv2njzzHsAB6ZVOja4PxTOFqOC+y
 WEICowxNKRwUqpSAI9VpCp6SmJL+ZPOl06tCIS495c+R1VDiM0G/eAYmtMW+AVMLWpqVypCHZYO
 qOIS60jhVWV4ao8ABC4g6apaMtFVZOmJ+EdhxK0WfL7mRKJVSJn1mm2dm3DiTUdreXR5EaBOARy
 1rtFJMvNoKCkQSyD3RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088
X-purgate-ID: tlsNG-16d1c6/1787912374-1ECC577B-D7168C4E/0/0
X-purgate-type: clean
X-purgate-size: 4375

On 25/8/26 21:09, Marc-AndrÃ© Lureau wrote:
> Rename monitor_printf->monitor_hmp_printf, monitor_vprintf->
> monitor_hmp_vprintf, and monitor_printc->monitor_hmp_printc, changing
> the first parameter from Monitor * to MonitorHMP * to enforce type
> safety. The implementation is also simplified: monitor_hmp_vprintf now
> directly calls g_strdup_vprintf + monitor_puts, removing the virtual
> dispatch via moncls->vprintf.
> 
> The dev_print() callbacks are temporarily using the MONITOR_HMP(mon)
> cast, they are fixed in the following commits.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio-hmp-cmds.c                  |   6 +-
>   backends/cryptodev-hmp-cmds.c           |   9 +-
>   block/monitor/block-hmp-cmds.c          | 170 +++++++++---------
>   chardev/char-hmp-cmds.c                 |  12 +-
>   disas/disas-mon.c                       |  10 +-
>   docs/devel/style.rst                    |   2 +-
>   docs/devel/writing-monitor-commands.rst |   8 +-
>   dump/dump-hmp-cmds.c                    |   5 +-
>   hw/char/virtio-serial-bus.c             |  10 +-
>   hw/core/machine-hmp-cmds.c              | 213 +++++++++++-----------
>   hw/core/sysbus.c                        |   5 +-
>   hw/hexagon/hexagon_tlb.c                |  44 ++---
>   hw/i386/kvm/xen-stubs.c                 |   6 +-
>   hw/i386/kvm/xen_evtchn.c                |  21 +--
>   hw/i386/sgx-hmp-stub.c                  |   3 +-
>   hw/i386/sgx.c                           |  29 ++-
>   hw/misc/auxbus.c                        |   9 +-
>   hw/misc/mos6522-stub.c                  |   3 +-
>   hw/net/rocker/rocker-hmp-cmds.c         | 146 ++++++++--------
>   hw/pci/pci-hmp-cmds.c                   | 114 ++++++------
>   hw/pci/pci-stub.c                       |   3 +-
>   hw/s390x/s390-skeys.c                   |   9 +-
>   hw/s390x/s390-stattrib.c                |  20 +--
>   hw/uefi/ovmf-log.c                      |   5 +-
>   hw/usb/bus.c                            |  11 +-
>   hw/usb/host-libusb.c                    |  21 ++-
>   hw/virtio/virtio-hmp-cmds.c             | 297 ++++++++++++++++---------------
>   hw/xen/xen-bus.c                        |   5 +-
>   include/disas/disas.h                   |   4 +-
>   include/monitor/hmp.h                   |  12 +-
>   migration/dirtyrate.c                   |  46 +++--
>   migration/migration-hmp-cmds.c          | 301 ++++++++++++++++----------------
>   monitor/hmp-cmds.c                      | 141 +++++++--------
>   monitor/hmp.c                           | 143 +++++++--------
>   monitor/monitor-internal.h              |   6 -
>   monitor/monitor.c                       |  33 ++--
>   net/net-hmp-cmds.c                      |  31 ++--
>   net/slirp.c                             |  31 ++--
>   qom/qom-hmp-cmds.c                      |  27 ++-
>   replay/replay-debugging.c               |   5 +-
>   stats/stats-hmp-cmds.c                  |  57 +++---
>   stubs/hmp-cmd-info_sev.c                |   3 +-
>   stubs/monitor-core.c                    |   2 +-
>   system/dirtylimit-hmp-cmds.c            |  10 +-
>   system/qdev-monitor.c                   |  19 +-
>   system/runstate-hmp-cmds.c              |  16 +-
>   system/tpm-hmp-cmds.c                   |  29 ++-
>   target/i386/cpu-apic.c                  |   3 +-
>   target/i386/monitor.c                   | 152 ++++++++--------
>   target/i386/sev.c                       |  35 ++--
>   target/m68k/monitor.c                   |   3 +-
>   target/ppc/monitor.c                    |   3 +-
>   target/riscv/monitor.c                  |  55 +++---
>   target/sh4/monitor.c                    |  29 ++-
>   target/sparc/monitor.c                  |   3 +-
>   target/xtensa/monitor.c                 |   3 +-
>   tests/unit/test-util-sockets.c          |   2 +-
>   tools/qemu-vnc/clipboard.c              |   4 +-
>   tools/qemu-vnc/stubs.c                  |   2 +-
>   trace/trace-hmp-cmds.c                  |  12 +-
>   ui/ui-hmp-cmds.c                        | 115 ++++++------
>   util/error-report.c                     |   2 +-
>   util/qemu-print.c                       |  11 +-
>   63 files changed, 1219 insertions(+), 1327 deletions(-)

Painful.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

